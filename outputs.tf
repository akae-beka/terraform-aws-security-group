# --------------------------------
# OUTPUTS FROM MODULE SECURITY GROUP
# --------------------------------

output "security_group_id" {
  value = module.aws_security_group.security_group_id
}