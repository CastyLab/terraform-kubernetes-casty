module "casty" {
  source                = "github.com/CastyLab/terraform-module-casty?ref=0.0.1"
  cdn                   = var.cdn
  object_storage        = var.object_storage
  dashboard             = var.dashboard
  api                   = var.api
  gateway               = var.gateway
  grpc                  = var.grpc
  oauth_google_secret   = var.oauth_google_secret
  oauth_spotify_secret  = var.oauth_spotify_secret
  oauth_discord_secret  = var.oauth_discord_secret
  mongodb               = var.mongodb
  redis                 = var.redis
  tls_email             = var.tls_email
  cloudflare            = var.cloudflare
  hcaptcha_secret       = var.hcaptcha_secret
  storageClass          = var.storageClass
  ingressController     = var.ingressController
}

