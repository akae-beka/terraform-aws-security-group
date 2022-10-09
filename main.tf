# --------------------------------
# DEPLOY AWS VPC SECURITY GROUPS
# --------------------------------

module "aws_security_group" {
  source = "./modules/security-groups"

  name        = var.name
  vpc_id      = var.vpc_id
  cidr_blocks = var.cidr_blocks
}