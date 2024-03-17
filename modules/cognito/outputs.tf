
output "cognito_user_pool_client_id" {
  value = aws_cognito_user_pool_client.user_pool_client.id
}

output "cognito_user_pool_client_secret" {
  value = aws_cognito_user_pool_client.user_pool_client.client_secret
}

output "cognito_identity_pool_id" {
  value = aws_cognito_user_pool_client.user_pool_client.user_pool_id
}

output "endpoint" {
  value = "https://${aws_cognito_user_pool.user_pool.endpoint}"
  
}

output "user_pool_id" {
  value = aws_cognito_user_pool.user_pool.id
}
