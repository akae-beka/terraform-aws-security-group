# ----------------------------------------------------------------------------------------------------------------------
# REQUIRE A SPECIFIC TERRAFORM VERSION OR HIGHER
# This module has been updated with 0.12 syntax, which means it is no longer compatible with any versions below 0.12.
# ----------------------------------------------------------------------------------------------------------------------

terraform {
  required_version = ">= 0.12"
}

# ---------------------------------------------------------------------------------------------------------------------
# DEPLOY AWS VPC SECURITY GROUPS
# ---------------------------------------------------------------------------------------------------------------------

module "aws_security_group" {
  source = "./modules/security-groups"

  name        = var.name
  vpc_id      = var.vpc_id
  cidr_blocks = var.cidr_blocks
}