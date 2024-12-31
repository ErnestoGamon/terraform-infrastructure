variable "namecheap_user" {
  description = "The Namecheap user"
  type        = string
}

variable "namecheap_api_key" {
  description = "The Namecheap API key"
  type        = string
}

variable "cloudflare_account_id" {
  description = "The Cloudflare account ID"
  type        = string
}

variable "cloudflare_email" {
  description = "The Cloudflare email"
  type        = string
}

variable "cloudflare_api_key" {
  description = "The Cloudflare API key"
  type        = string
}

variable "domains" {
  type        = list(string)
  description = "List of domain names to create resources for"
}

variable "vercel_api_token" {
  description = "The Vercel API token"
  type        = string
}

variable "vercel_team_id" {
  description = "The Vercel team ID"
  type        = string
}

variable "gh_token" {
  description = "The GitHub token"
  type        = string
}
