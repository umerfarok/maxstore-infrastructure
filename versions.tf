terraform {
    required_version = "1.7.3"
     required_providers {
        aws = {
        source = "hashicorp/aws"
        version = "5.35.0"
        }
    }
    backend "s3" {
        bucket = "maxstore-terraform-admin-dev"
        key    = "maxstore/terraform.tfstate"
        region = "us-east-1"
    }
}