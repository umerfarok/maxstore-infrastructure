module "admin-infra" {
    source = "./modules/admin-infra"
    vpc_cidr = var.vpc_cidr
    aws_region = var.aws_region
    public_ssh_key = var.public_ssh_key
    private_ssh_key = var.private_ssh_key
}