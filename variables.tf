variable "vpc_cidr" {
    type = string
    description = "VPC CIDR range"
}

variable "aws_region" {
    type = string
    description = "AWS region"
}

variable "public_ssh_key" {
  type = string
}

variable "private_ssh_key" {
  type = string
}