variable "user_gateway_domain" {
  description = "User gateway ingress domain_name"
  type        = string
}

variable "theater_gateway_domain" {
  description = "Theater gateway ingress domain_name"
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
    repository  = "castylab/gateway"
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

variable "tls" {
  description = "TLS config"
  type        = object({
    enabled = bool
    ca_server = string
    email = string
  })
}

variable "grpc" {
  description = "gRPC config"
  type        = object({
    host = string
    port = number
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
