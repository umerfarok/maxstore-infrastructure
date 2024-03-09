output "cognito_user_pool_client_id" {
  value = module.cognito.cognito_user_pool_client_id
}

output "cognito_user_pool_client_secret" {
  value = module.cognito.cognito_user_pool_client_secret
  sensitive = true
}

output "cognito_identity_pool_id" {
  value = module.cognito.cognito_identity_pool_id
}

output "endpoint" {
  value = module.cognito.endpoint
}