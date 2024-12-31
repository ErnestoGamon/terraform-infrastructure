module "zones_dns_gamon" {
  source                = "github.com/ErnestoGamon/terraform-dns-manager"
  domains               = ["gamon.io"]
  namecheap_user        = var.namecheap_user
  namecheap_api_key     = var.namecheap_api_key
  cloudflare_account_id = var.cloudflare_account_id
  cloudflare_email      = var.cloudflare_email
  cloudflare_api_key    = var.cloudflare_api_key
}

resource "cloudflare_record" "gamon_mail_mx_1" {
  name    = "@"
  type    = "MX"
  zone_id = module.zones_dns_gamon.zone_ids["gamon.io"]
  data {
    priority = 10
    value    = "mx01.mail.icloud.com"
  }
}

resource "cloudflare_record" "gamon_mail_mx_2" {
  name    = "@"
  type    = "MX"
  zone_id = module.zones_dns_gamon.zone_ids["gamon.io"]
  data {
    priority = 10
    value    = "mx02.mail.icloud.com"
  }
}

resource "cloudflare_record" "gamon_mail_txt" {
  name    = "@"
  type    = "TXT"
  zone_id = module.zones_dns_gamon.zone_ids["gamon.io"]
  data {
    value = "\"apple-domain=NotfXwnyPzqm73Qz\""
  }
}

resource "cloudflare_record" "gamon_mail_spf" {
  name    = "@"
  type    = "TXT"
  zone_id = module.zones_dns_gamon.zone_ids["gamon.io"]
  data {
    value = "\"v=spf1 include:icloud.com ~all\""
  }
}

resource "cloudflare_record" "gamon_mail_dkim" {
  name    = "sig1._domainkey"
  type    = "CNAME"
  zone_id = module.zones_dns_gamon.zone_ids["gamon.io"]
  data {
    value = "sig1.dkim.gamon.io.at.icloudmailadmin.com"
  }
}

resource "cloudflare_record" "root" {
  name    = "@"
  type    = "A"
  zone_id = module.zones_dns_gamon.zone_ids["gamon.io"]
  data {
    value = "76.76.21.21"
  }
}

resource "cloudflare_record" "www" {
  zone_id = module.zones_dns_gamon.zone_ids["gamon.io"]
  name    = "www"
  type    = "CNAME"
  proxied = false
  data {
    value = "cname.vercel-dns.com"
  }
}