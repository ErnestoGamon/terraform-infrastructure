terraform {
  required_version = ">= 1.10.3"
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.49.1"
    }
    vercel = {
      source  = "vercel/vercel"
      version = "~> 2.0"
    }
    github = {
      source  = "integrations/github"
      version = "~> 6.4"
    }
  }
  cloud {

    organization = "voltaflow"

    workspaces {
      name = "core-resources"
    }
  }
}
