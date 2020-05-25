# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# ---------------------------------------------------------------------------------------------------------------------

variable "create_sg" {
  description = "Controls if the Security Group should be created."
  type        = bool
  default     = true
}

variable "vpc_id" {
  description = "The VPC ID."
  type        = string
}

variable "name" {
  description = "The name of the security group."
  type        = string
}

variable "cidr_blocks" {
  description = "List of CIDR blocks."
  type        = list(string)
}

variable "security_group_config" {
  description = "Security Group configuration"
  type        = any
  default = [
    {
      description = "Managed by Terraform"
    },
    {
      ssh = {
        port        = 22
        protocol    = "tcp"
        description = "Security Group SSH"
      },
      egress = {
        port        = 0
        protocol    = "-1"
        description = "Egress to internet"
        cidr_blocks = ["0.0.0.0/0"]
      }
    }
  ]
}

/*
variable "security_group_egress" {
  description = ""
  type        = any
  default = [
    {
      port        = 0
      protocol    = "-1"
      description = "Egress to internet"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}*/
