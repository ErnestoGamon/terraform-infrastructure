resource "github_repository" "portfolio" {
  name                   = "Portfolio"
  description            = "Modern, responsive portfolio showcasing my expertise as a Cloud Solutions Architect and DevOps Specialist."
  topics                 = ["nextjs", "react", "typescript", "tailwind"]
  visibility             = "public"
  has_issues             = true
  has_downloads          = false
  delete_branch_on_merge = true
}

resource "github_repository" "terraform_infrastructure" {
  name                   = "terraform-infrastructure"
  description            = "Repository for Terraform infrastructure."
  topics                 = ["terraform", "infrastructure", "iac", "vercel", "cloudflare", "github"]
  visibility             = "public"
  has_issues             = true
  has_downloads          = false
  delete_branch_on_merge = true
}