resource "aws_cognito_user_pool" "user_pool" {
name = var.user_pool_name


  account_recovery_setting {
    recovery_mechanism {
      name     = "verified_email"
      priority = 1
    }
  }

  alias_attributes = ["email", "preferred_username"]
  auto_verified_attributes = [
    "email",
  ]
  user_attribute_update_settings {
    attributes_require_verification_before_update = ["email"]
  }

  admin_create_user_config {
    allow_admin_create_user_only = true
    invite_message_template {
      email_message = "Your username is {username} and temporary password is {####}"
      email_subject = "Welcome to Maxstore!"
      sms_message   = "Your username is {username} and temporary password is {####}"
    }
  }

  password_policy {
    minimum_length                   = 8
    require_lowercase                = true
    require_numbers                  = true
    require_symbols                  = true
    require_uppercase                = true
    temporary_password_validity_days = 7
  }

  username_configuration {
    case_sensitive = true
  }
}

resource "aws_cognito_user_pool_client" "user_pool_client" {
  name                                 = var.client_name
  user_pool_id                         = aws_cognito_user_pool.user_pool.id
  access_token_validity                = 5
  id_token_validity                    = 5
  refresh_token_validity               = 30
  allowed_oauth_flows_user_pool_client = true
  allowed_oauth_flows                  = ["code"]
  allowed_oauth_scopes                 = ["openid", "profile", "email", "phone", "aws.cognito.signin.user.admin"]
  auth_session_validity                = 3
  callback_urls = concat(
    ["https://${var.webapp_domain}/"],
    var.localhost_callback ? ["http://localhost:3000/"] : []
  )
  enable_token_revocation                       = true
  enable_propagate_additional_user_context_data = false
  explicit_auth_flows = [
    "ALLOW_REFRESH_TOKEN_AUTH",
    "ALLOW_USER_SRP_AUTH",
  ]
  generate_secret = false
  logout_urls = concat(
    ["https://${var.webapp_domain}/"],
    var.localhost_callback ? ["http://localhost:3000/"] : []
  )
  prevent_user_existence_errors = "ENABLED"
  token_validity_units {
    access_token  = "minutes"
    id_token      = "minutes"
    refresh_token = "days"
  }

  supported_identity_providers = [
    "COGNITO",
  ]

  lifecycle {
    ignore_changes = [
      "supported_identity_providers"
    ]
  }
}

resource "aws_cognito_user_group" "groups" {
  for_each = {
    for group in var.group_names : group => group
  }
  name         = each.value
  user_pool_id = aws_cognito_user_pool.user_pool.id
}

resource "aws_cognito_user_pool_domain" "domain" {
  domain       = var.cognito_domain
  user_pool_id = aws_cognito_user_pool.user_pool.id
}

resource "aws_cognito_user_pool_ui_customization" "ui_customization" {
  user_pool_id = aws_cognito_user_pool.user_pool.id
  css          = file("${path.module}/templates/maxstore.css")
  image_file   = filebase64("${path.module}/templates/logo.png")
}