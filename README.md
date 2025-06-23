# terraform-infra
# Terraform Migration Strategy

## Overview

This project provides a modular Terraform configuration to migrate an existing AWS environment (originally created using AWS CDK or CloudFormation) to Infrastructure as Code (IaC) using Terraform.

The architecture assumes a basic setup including a VPC and an Application Load Balancer (ALB), and is structured to support multiple environments (e.g., dev, stg, prod).

##  Project Structure

terraform-migration/
├── modules/
│   ├── elb/
│   │   ├── main.tf
│   │   └── variables.tf
│   └── vpc/
│       ├── main.tf
│       ├── outputs.tf
│       └── variables.tf
└── envs/
    └── dev/
        ├── dev.auto.tfvars
        ├── main.tf
        └── variables.tf


## Migration Steps

1. **Import Existing Resources**  
   Use the Terraform import command to bring existing CDK/CloudFormation resources under Terraform management:
   ```bash
   terraform import aws_vpc.main vpc-xxxxxxxx
   terraform import aws_lb.main arn:aws:elasticloadbalancing:region:account-id:loadbalancer/app/your-lb-name/xxxxxxxxx
   ```

2. **Initialize Terraform**  
   Navigate to the appropriate environment directory (e.g., `envs/dev`) and initialize Terraform:
   ```bash
   terraform init
   ```

3. **Review the Plan**  
   Ensure Terraform correctly recognizes the imported resources:
   ```bash
   terraform plan
   ```

4. **Apply Configuration**  
   Once the plan looks good, apply it to bring the resources fully under Terraform control:
   ```bash
   terraform apply
   ```

---

##  Customization

- Modify `dev.auto.tfvars` or add `.auto.tfvars` files for other environments.
- Update `main.tf` inside environment folders to include additional modules like RDS, Redis, etc.

---

## Notes

- Default values for variables are defined where appropriate.
- Module outputs are used to wire dependencies (e.g., ELB depends on VPC outputs).
- This is a baseline to kick off a clean and scalable IaC practice using Terraform.
