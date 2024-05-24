
variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "subnet_cidr_block" {
  description = "The CIDR block for the subnet"
  type        = string
}

variable "avail_zone" {
  description = "The availability zone"
  type        = string
}

variable "env_prefix" {
  description = "Environment prefix"
  type        = string
}

variable "instance_type" {
  description = "The type of instance"
  type        = string
}

variable "policy" {
  description = "The JSON policy document"
  type        = string
}

variable "AWS_ACCESS_KEY_ID" {
  description = "The AWS access key ID"
  type        = string
}

variable "AWS_SECRET_ACCESS_KEY" {
  description = "The AWS secret access key"
  type        = string
}
