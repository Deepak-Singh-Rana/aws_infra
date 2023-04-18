# aws_infra
This Terraform code is used to deploy AWS Infrastructure.

```sh
https://github.com/dsr4hsp/aws_infra
```

## Clone the GIT Repository to Local Machine
- GIT Commands
  ```
   git clone https://github.com/dsr4hsp/aws_infra
   cd aws_infra
  ```

## Deploy AWS Infrastructure
- Terraform Commands ( Sample to deploy dev environment using custom var file)
  ```
   terraform init
   terraform apply -var-file="dev.tfvars" -auto-approve
  ```
  
## Destroy AWS Infrastructure
- Terraform Commands 
  ```
  terraform destroy -auto-approve
  ```
