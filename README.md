# aws_infra
This Terraform code is used to deploy AWS Infrastructure.

```sh
https://github.com/Deepak-Singh-Rana/aws_infra
```

## Clone the GIT Repository to Local Machine
- GIT Commands
  ```
   git clone https://github.com/Deepak-Singh-Rana/aws_infra
   cd aws_infra
  ```

## Deploy AWS Infrastructure
- Terraform Commands ( Sample to deploy dev environment using custom var file)
  ```
   terraform init
   terraform apply -var-file="dev.tfvars" -target=module.vpc -auto-approve
   terraform apply -var-file="dev.tfvars" -auto-approve
  ```
  Custom environment variable files: Dev - dev.tfvars, Production - prod.tfvars. 
  The VPC and subnets will be deployed first and their details will be used to deploy rest of the infrastructure.
## Destroy AWS Infrastructure
- Terraform Commands ( Sample to destroy dev environment using custom var file)
  ```
  terraform destroy -var-file="dev.tfvars" -auto-approve
  ```
