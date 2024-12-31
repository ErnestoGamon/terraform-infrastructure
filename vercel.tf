# A project that is connected to a git repository.
# Deployments will be created automatically
# on every branch push and merges onto the Production Branch.
resource "vercel_project" "portfolio" {
  name      = "portfolio"
  framework = "nextjs"

  git_repository = {
    type = "github"
    repo = github_repository.portfolio.full_name
  }
  auto_assign_custom_domains = true

}

resource "vercel_project_domain" "gamon_io" {
  project_id = vercel_project.portfolio.id
  domain     = "www.gamon.io"
}

resource "vercel_project_domain" "example_redirect" {
  project_id = vercel_project.portfolio.id
  domain     = "gamon.io"

  redirect             = vercel_project_domain.gamon_io.domain
  redirect_status_code = 307
}

resource "vercel_deployment" "git_deployment" {
  project_id = vercel_project.portfolio.id
  ref        = "main"
}