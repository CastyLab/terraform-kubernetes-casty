variable "storageClass" {
  type = string
  description = "Kubernetes storageClass name"
}

variable "ingressController" {
  type = string
  description = "Ingress controller"
}

variable "tls_email" {
  type = string
  description = "Tls email"
}

variable "cloudflare" {
  type = object({
    email = string
    token = string
  })
  description = "Cloudflare Secrets"
  sensitive = true
}

variable "hcaptcha_secret" {
  type = string
  description = "Hcaptcha secret"
  sensitive = true
}

variable "object_storage" {
  type = object({
    endpoint = string
    access_key = string
    secret_key = string
  })
  default = {
    endpoint  = "minio.minio.svc.cluster.local:9000"
    access_key = ""
    secret_key = ""
  }
  description = "ObjectStorage Configurations"
  sensitive = true
}

variable "cdn" {
  type = object({
    env = string
    imageTag = string
    debug = bool
    domain_name = string
    sentry_dsn = string
    tls_enabled = bool
    tls_caServer = string
  })
  description = "CDN server Configurations"
}

variable "dashboard" {
  type = object({
    domain_name = string
    imageTag = string
    tls_enabled = bool
    tls_caServer = string
  })
  description = "Dashboard Configurations"
}

variable "api" {
  type = object({
    env = string
    imageTag = string
    debug = bool
    domain_name = string
    access_control_allow_origin = string
    sentry_dsn = string
    tls_enabled = bool
    tls_caServer = string
  })
  description = "ApiServer Configurations"
}

variable "gateway" {
  type = object({
    env = string
    imageTag = string
    debug = string
    user_gateway_domain    = string
    theater_gateway_domain = string
    sentry_dsn = string
    tls_enabled = bool
    tls_caServer = string
  })
  description = "GatewayServer Configurations"
}

variable "grpc" {
  type = object({
    env = string
    imageTag = string
    debug = bool
    sentry_dsn = string
    access_token_secret = string
    refresh_token_secret = string
  })
  description = "GrpcServer Configurations"
  sensitive = true
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
    auth_enabled = bool
    password = string
    masterName = string
  })
  description = "Redis config"
  sensitive = true
}

variable "mongodb" {
  type = object({
    auth_enabled = bool
    root_password = string
    username = string
    password = string
    database = string
  })
  description = "Mongodb config"
  sensitive = true
}
