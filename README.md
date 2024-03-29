# MaxStore Terraform Project

This project uses Terraform to provision and manage resources for MaxStore.

## Project Structure
.gitignore .terraform.lock.hcl key.pem maxstore.tfvars.json modules/ admin-infra/ main.tf outputs.tf templates/ cloudinit.yaml variables.tf modules.tf outputs.tf privatekeygithub.pem providers.tf README.md terraform.tfplan terraform.tfstate variables.tf versions.tf

## Prerequisites

- Terraform installed (version specified in [`versions.tf`](command:_github.copilot.openRelativePath?%5B%22versions.tf%22%5D "versions.tf"))
- AWS CLI configured with appropriate access credentials

## Usage

1. Initialize the Terraform project:

```bash
terraform init
```
2. Validate the Terraform configuration files:
```bash
terraform validate
```
3. Generate a plan and save it to terraform.tfplan:
```bash
terraform plan -var-file="maxstore.tfvars.json" -out terraform.tfplan

```
4. Apply the plan:
```bash
terraform apply "terraform.tfplan"
```
5. To destroy the resources when you're done:
```bash
terraform destroy -var-file="maxstore.tfvars.json"
```
6. if you have done some manualy changes created resource in cloud do this 
```bash
 terraform refresh -var_file="maxstore.tfvars.json"
```


## Variables
Variables are defined in variables.tf and values are provided in maxstore.tfvars.json.

## Outputs
Outputs are defined in outputs.tf.