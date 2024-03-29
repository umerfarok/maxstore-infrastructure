# module "admin-infra" {
#     source = "./modules/admin-infra"
#     vpc_cidr = var.vpc_cidr
#     aws_region = var.aws_region
#     public_ssh_key = var.public_ssh_key
#     private_ssh_key = var.private_ssh_key
# }

module "cognito" {
    source = "./modules/cognito"
    user_pool_name = var.user_pool_name
    client_name = var.client_name
    localhost_callback = var.localhost_callback
    group_names = var.group_names
    webapp_domain = var.webapp_domain
    cognito_domain = var.cognito_domain
    allowed_oauth_flows = var.allowed_oauth_flows
}

module "s3" {
    source = "./modules/s3"
    bucket_name = var.bucket_name
    bucket_acl = var.bucket_acl
  
}