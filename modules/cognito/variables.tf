variable "user_pool_name" {
  type        = string
  description = "Cognito user pool name"
}

variable "client_name" {
  description = "The name of the Cognito user pool client"
  type        = string
}

variable "webapp_domain" {
  description = "The domain of your web application"
  type        = string
}

variable "localhost_callback" {
  description = "Whether to include localhost in the callback URLs"
  type        = bool
}

variable "group_names" {
  description = "The names of the user groups"
  type        = list(string)
}

variable "cognito_domain" {
  description = "The domain for the Cognito user pool"
  type        = string
}
variable "allowed_oauth_flows" {
  description = "The allowed OAuth flows"
  type        = list(string)
}

