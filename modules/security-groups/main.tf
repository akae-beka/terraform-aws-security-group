# --------------------------------
# CREATE AWS VPC SECURITY GROUPS
# --------------------------------

locals {
  tags = {
    Service     = "Security Group"
    Description = "Managed by Terraform"
  }
}

resource "aws_security_group" "main" {
  count = var.create_sg ? 1 : 0

  name        = var.name
  vpc_id      = var.vpc_id
  description = lookup(var.security_group_config[count.index], "description", null)

  dynamic "ingress" {
    iterator = inbound_rules
    for_each = length(keys(lookup(var.security_group_config[1], "ssh", {}))) == 0 ? [] : [lookup(var.security_group_config[1], "ssh", {})]
    content {
      to_port     = lookup(inbound_rules.value, "port", null)
      from_port   = lookup(inbound_rules.value, "port", null)
      protocol    = lookup(inbound_rules.value, "protocol", null)
      description = lookup(inbound_rules.value, "description", null)
      cidr_blocks = var.cidr_blocks
    }
  }

  dynamic "egress" {
    iterator = outbound_rules
    for_each = length(keys(lookup(var.security_group_config[1], "egress", {}))) == 0 ? [] : [lookup(var.security_group_config[1], "egress", {})]
    content {
      to_port     = lookup(outbound_rules.value, "port", null)
      from_port   = lookup(outbound_rules.value, "port", null)
      protocol    = lookup(outbound_rules.value, "protocol", null)
      description = lookup(outbound_rules.value, "description", null)
      cidr_blocks = lookup(outbound_rules.value, "cidr_blocks", null)
    }
  }

  tags = merge(
    local.tags,
    {
      Name = format("%s", var.name)
    }
  )
}
