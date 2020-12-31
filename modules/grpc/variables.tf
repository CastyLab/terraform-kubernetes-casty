variable "replica_count" {
  description = "Kubernetes deployment replicaCount"
  type = number
  default = 3
}

variable "image" {
  description = "Kubernetes container image"
  type = object({
    repository  = string
    pull_policy = string
    tag         = string
  })
  default = {
    repository  = "castylab/api"
    pull_policy = "Always"
    tag         = "latest"
  }
}

variable "debug" {
  description = "App config debug"
  type        = bool
  default     = true
}

variable "env" {
  description = "App config env"
  type        = string
  default     = "dev"
}

variable "sentry_dsn" {
  description = "Sentry DSN"
  type        = string
  default     = ""
  sensitive   = true
}

variable "hcaptcha_secret" {
  description = "Hcaptcha secret key"
  type        = string
  default     = ""
  sensitive   = true
}

variable "redis" {
  type = object({
    host        = string
    port        = number
    replicaset  = bool
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

variable "object_storage" {
  type = object({
    endpoint = string
    access_key = string
    secret_key = string
  })
  description = "ObjectStorage Configurations"
  sensitive = true
}

variable "access_token_secret" {
  description = "JWT secret token"
  type        = string
  sensitive   = true
}

variable "refresh_token_secret" {
  description = "JWT refresh secret token"
  type        = string
  sensitive   = true
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

