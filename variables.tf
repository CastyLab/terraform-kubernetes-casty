variable "ingress_controller" {
  type = string
  description = "IngressController name"
}

variable "hcaptcha_secret" {
  type = string
  description = "Hcaptcha secret key "
  sensitive = true
}

variable "cloudflare" {
  type = object({
    token = string
    email = string
  })
  description = "Cloudflare configurations"
  sensitive = true
}

variable "cdn" {
  type = object({
    replica_count     = number
    env               = string
    image_tag         = string
    image_pull_policy = string
    image_repository  = string
    debug             = bool
    domain_name       = string
    sentry_dsn        = string
    tls_enabled       = bool
    tls_ca_server     = string
  })
  description = "CDN server Configurations"
}

variable "api" {
  type = object({
    replica_count               = number
    env                         = string
    image_tag                   = string
    image_pull_policy           = string
    image_repository            = string
    debug                       = bool
    domain_name                 = string
    access_control_allow_origin = string
    sentry_dsn                  = string
    tls_enabled                 = bool
    tls_ca_server               = string
  })
  description = "ApiServer Configurations"
}

variable "object_storage" {
  type = object({
    endpoint = string
    access_key = string
    secret_key = string
  })
  description = "ObjectStorage Configurations"
  sensitive = true
}

variable "dashboard" {
  type = object({
    replica_count     = number
    domain_name       = string
    image_tag         = string
    image_pull_policy = string
    image_repository  = string
    tls_enabled       = bool
    tls_ca_server     = string
  })
  description = "Dashboard Configurations"
}

variable "gateway" {
  type = object({
    replica_count          = number
    env                    = string
    image_tag              = string
    image_pull_policy      = string
    image_repository       = string
    debug                  = string
    user_gateway_domain    = string
    theater_gateway_domain = string
    sentry_dsn             = string
    tls_enabled            = bool
    tls_ca_server           = string
  })
  description = "GatewayServer Configurations"
}

variable "grpc" {
  type = object({
    replica_count        = number
    env                  = string
    image_tag            = string
    image_pull_policy    = string
    image_repository     = string
    debug                = bool
    sentry_dsn           = string
    access_token_secret  = string
    refresh_token_secret = string
  })
  description = "GrpcServer Configurations"
  sensitive = true
}

variable "grpc_connection" {
  description = "gRPC connection"
  type = object({
    host = string
    port = number
  })
  default = {
    host = "casty-grpc.casty-grpc.svc.cluster.local"
    port = 55283
  }
}

variable "oauth_google_secret" {
  type = object({
    client_id = string
    client_secret = string
    project_id = string
    redirect_uri = string
  })
  description = "Google oauth configiguration"
  sensitive = true
}

variable "oauth_spotify_secret" {
  type = object({
    client_id = string
    client_secret = string
    redirect_uri = string
  })
  description = "Spotify oauth configiguration"
  sensitive = true
}

variable "oauth_discord_secret" {
  type = object({
    client_id = string
    client_secret = string
    redirect_uri = string
  })
  description = "Discord oauth configiguration"
  sensitive = true
}

variable "redis" {
  type = object({
    replicaset  = bool
    host        = string
    port        = number
    password    = string
    master_name = string
  })
  description = "Redis config"
  sensitive = true
}

variable "mongodb" {
  type = object({
    host     = string
    port     = number
    username = string
    password = string
    database = string
  })
  description = "Mongodb config"
  sensitive = true
}

