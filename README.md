# ec2-nginx-terraform-project

This project provisions an AWS VPC stack and launches an EC2 instance that automatically installs Nginx to host a simple web server.

## Prerequisites
Before running this project, ensure you have:
- [Terraform](https://hashicorp.com) installed
- AWS credentials configured locally (e.g., via `aws configure`)
- An existing SSH key pair

## Setup & Usage

1. **Create a variables file:**  
   Create a `terraform.tfvars` file in the root directory and paste the following configuration:

   ```hcl
   key_path   = "path/to/your/public_key.pub" # Path to your public SSH key (.pub)
   aws_region = "us-east-1"                   # Target AWS region
   my_ip      = "203.0.113.25/32"             # Your IP address in CIDR notation
   ```

2. **Check the instance type (optional):**  
   Depending on your chosen AWS region, you may need to update the EC2 instance type (default: `t3.micro`).

3. **Deploy the infrastructure:**  
   Run the following commands in order:
   ```bash
   terraform init
   terraform plan
   terraform apply
   ```

4. **Verify the web server:**  
   Once applied, locate the EC2 instance's public IP address in your AWS console (or Terraform outputs) and open `http://<ec2_public_ip>` in your browser.

5. **Clean up:**  
   When you are finished, destroy the resources to avoid ongoing AWS charges:
   ```bash
   terraform destroy
   ```
