variable "region" {
  description = "Aws region"
  type        = string
  default = "us-east-1"
}
variable "name_prefix" {
  description = "Prefix for naming resources"
  type        = string
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  type    = string
  default = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  type    = string
  default = "10.0.2.0/24"
}

variable "az" {
  description = "Availability Zone"
  type        = string
  default     = "us-east-1a"
}

