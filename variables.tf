variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR range"
}

variable "aws_region" {
  type        = string
  description = "AWS region"
}

variable "public_ssh_key" {
  type = string
}

variable "private_ssh_key" {
  type = string
}

variable "user_pool_name" {
  type        = string
  description = "Cognito user pool name"
}

variable "client_name" {
  type        = string
  description = "Cognito client name"
}

variable "callback_urls" {
  type        = list(string)
  description = "Cognito client callback URLs"
}

variable "allowed_oauth_flows" {
  type        = list(string)
  description = "Cognito client allowed OAuth flows"
}

variable "localhost_callback" {
  type        = bool
  description = "Description of localhost_callback"
}

variable "group_names" {
  type        = list(string)
  description = "Cognito user pool group names"
  
}
variable "webapp_domain" {
  type        = string
  description = "Web application domain"
}

variable "cognito_domain" {
  type        = string
  description = "Cognito domain"
}