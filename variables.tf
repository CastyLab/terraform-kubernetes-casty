variable "storageClass" {
  type = string
  description = "StorageClass name"
}

variable "ingressController" {
  type = string
  description = "IngressController name"
}

variable "tls_email" {
  type = string
  description = "TLS email"
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
    domain_name = string
    imageTag = string
    tls_enabled = bool
    tls_caServer = string
  })
  description = "Dashboard Configurations"
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

