variable "domain_name" {
  description = "Api Service ingress domain_name"
  type        = string
}

variable "ingress_controller" {
  description = "Ingress controller"
  type        = string
  default     = "nignx"
}

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

variable "tls" {
  description = "TLS config"
  type        = object({
    enabled = bool
    ca_server = string
    email = string
  })
}

variable "cloudflare" {
  description = "Cloudflare credentials for tls verification challenges"
  type        = object({
    email = string
    token = string
  })
  sensitive = true
}

variable "access_control_allow_origin" {
  description = "Access control allow origin for http server"
  default     = "*"
  type        = string
}

variable "grpc" {
  description = "gRPC config"
  type        = object({
    host = string
    port = number
  })
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
