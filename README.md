# terraform-infrastructure

![Logo](assets/img/logo.png)

This repository contains the Terraform configuration for managing various resources on Cloudflare, Vercel, and GitHub.

## Project Structure

- `terraform.tf`: Main Terraform configuration, including providers and cloud settings.
- `providers.tf`: Configuration for the providers used (Cloudflare, Vercel, GitHub).
- `variables.tf`: Definition of variables used in the project.
- `dns.tf`: DNS configuration using Cloudflare and Namecheap.
- `github.tf`: Configuration of repositories on GitHub.
- `vercel.tf`: Configuration of projects and domains on Vercel.

### Requirements

- Terraform v1.10.3 or higher
- Credentials for Cloudflare, Vercel, and GitHub

### Setup

1. Clone this repository:
    ```sh
    git clone https://github.com/your-username/terraform-infrastructure.git
    cd terraform-infrastructure
    ```

2. Initialize Terraform:
    ```sh
    terraform init
    ```

3. Review the execution plan, specifying the variables file:
    ```sh
    terraform plan -var-file="terraform.tfvars"
    ```

4. Apply the changes, specifying the variables file:
    ```sh
    terraform apply -var-file="terraform.tfvars"
    ```

### Note

The **terraform.tfvars** file is stored in 1Password in the Gamon vault.

## Modules

### Module `zones_dns_gamon`

This module manages the DNS zones for the specified domains.

```hcl
module "zones_dns_gamon" {
  source                = "github.com/ErnestoGamon/terraform-dns-manager"
  domains               = ["gamon.io"]
  namecheap_user        = var.namecheap_user
  namecheap_api_key     = var.namecheap_api_key
  cloudflare_account_id = var.cloudflare_account_id
  cloudflare_email      = var.cloudflare_email
  cloudflare_api_key    = var.cloudflare_api_key
}