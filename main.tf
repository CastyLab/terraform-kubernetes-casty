module "grpc" {
  source = "./modules/grpc"
  image  = {
    tag         = var.grpc.image_tag
    pull_policy = var.grpc.image_pull_policy
    repository  = var.grpc.image_repository
  }
  replica_count        = var.grpc.replica_count
  debug                = var.grpc.debug
  env                  = var.grpc.env
  sentry_dsn           = var.grpc.sentry_dsn
  hcaptcha_secret      = var.hcaptcha_secret
  redis                = var.redis
  mongodb              = var.mongodb
  object_storage       = var.object_storage
  access_token_secret  = var.grpc.access_token_secret
  refresh_token_secret = var.grpc.refresh_token_secret
  oauth_google_secret  = var.oauth_google_secret
  oauth_spotify_secret = var.oauth_spotify_secret
  oauth_discord_secret = var.oauth_discord_secret
}

module "api" {
  source = "./modules/api"
  image  = {
    tag         = var.api.image_tag
    pull_policy = var.api.image_pull_policy
    repository  = var.api.image_repository
  }
  ingress_controller = var.ingress_controller
  domain_name        = var.api.domain_name
  debug              = var.api.debug
  env                = var.api.env
  sentry_dsn         = var.api.sentry_dsn
  hcaptcha_secret    = var.hcaptcha_secret
  tls                = var.tls
  cloudflare         = var.cloudflare
  grpc               = var.grpc
  object_storage     = var.object_storage
  replica_count      = var.api.replica_count
  access_control_allow_origin = var.api.access_control_allow_origin
  depends_on     = [module.grpc]
}

module "gateway" {
  source = "./modules/gateway"
  image  = {
    tag         = var.gateway.image_tag
    pull_policy = var.gateway.image_pull_policy
    repository  = var.gateway.image_repository
  }
  replica_count          = var.gateway.replica_count
  debug                  = var.gateway.debug
  env                    = var.gateway.env
  grpc                   = var.grpc
  user_gateway_domain    = var.gateway.user_gateway_domain
  theater_gateway_domain = var.gateway.theater_gateway_domain
  ingress_controller     = var.ingress_controller
  sentry_dsn             = var.gateway.sentry_dsn
  tls                    = var.tls
  cloudflare             = var.cloudflare
  redis                  = var.redis
  depends_on             = [module.grpc]
}

module "cdn" {
  source = "./modules/cdn"
  image  = {
    tag         = var.cdn.image_tag
    pull_policy = var.cdn.image_pull_policy
    repository  = var.cdn.image_repository
  }
  debug              = var.cdn.debug
  env                = var.cdn.env
  replica_count      = var.cdn.replica_count
  tls                = var.tls
  cloudflare         = var.cloudflare
  sentry_dsn         = var.cdn.sentry_dsn
  domain_name        = var.cdn.domain_name
  ingress_controller = var.ingress_controller
  object_storage     = var.object_storage
}

module "dashboard" {
  source = "./modules/dashboard"
  image  = {
    tag         = var.dashboard.image_tag
    pull_policy = var.dashboard.image_pull_policy
    repository  = var.dashboard.image_repository
  }
  replica_count      = var.dashboard.replica_count
  hcaptcha_secret    = var.hcaptcha_secret
  tls                = var.tls
  cloudflare         = var.cloudflare
  debug              = var.dashboard.debug
  env                = var.dashboard.env
  ingress_controller = var.ingress_controller
  sentry_dsn         = var.sentry_dsn
  domain_name        = var.dashboar.domain_name
  depends_on = [
    module.api,
    module.gateway
  ]
}
