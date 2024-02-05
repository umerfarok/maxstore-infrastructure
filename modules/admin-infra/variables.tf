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
   description = "Public SSH key"
  #  default = cat "C:\Users\Umer Farooq\.ssh\id_rsa.pub"
}

variable "private_ssh_key" {
  type = string
  # default = cat "C:\Users\Umer Farooq\.ssh\id_rsa"
   description = "Private SSH key"
}