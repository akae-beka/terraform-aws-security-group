# ---------------------------------------------------------------------------------------------------------------------
# ENVIRONMENT VARIABLES
# Define these secrets as environment variables
# ---------------------------------------------------------------------------------------------------------------------

# AWS_ACCESS_KEY_ID
# AWS_SECRET_ACCESS_KEY
# AWS_DEFAULT_REGION

# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# ---------------------------------------------------------------------------------------------------------------------

variable "name" {
  description = "The name of the security group."
  type = string
  default = null
}

variable "vpc_id" {
  description = "The VPC ID."
  type = string
}

variable "cidr_blocks" {
  description = "List of CIDR blocks."
  type = list(string)
}