resource "helm_release" "casty-api" {
  
  name        = "casty-api"
  respository = "https://github.com/CastyLab/helm-charts"
  chart       = "casty/casty-api"
  values      = [file("${path.module}/values.yaml")]

  set {
    name  = "replicaCount"
    value = var.replica_count
  }

  set {
    name  = "ingressController"
    value = var.ingress_controller
  }

  set {
    name = "image.repository"
    value = var.image.repository
  }
  
  set {
    name = "image.pullPolicy"
    value = var.image.pull_policy
  }

  set {
    name = "image.tag"
    value = var.image.tag
  }

  set {
    name  = "tls.dnsNames[0]"
    value = var.domain_name
  }

  set {
    name  = "domainName"
    value = var.domain_name
  }
  
  set {
    name  = "appConfig.app.debug"
    value = var.debug
  }

  set {
    name  = "appConfig.app.env"
    value = var.env
  }

  set {
    name  = "tls.enabled"
    value = var.tls.enabled
  }

  set {
    name  = "tls.caServer"
    value = var.tls.ca_server
  }

  set {
    name  = "tls.email"
    value = var.tls.email
  }

  set {
    name  = "tls.cloudflare.token"
    value = var.cloudflare.token
  }

  set {
    name  = "tls.cloudflare.email"
    value = var.cloudflare.email
  }

  set {
    name  = "appConfig.http.access_control_allow_origin"
    value = var.access_control_allow_origin
  }

  set {
    name  = "appConfig.secrets.sentry_dsn"
    value = var.sentry_dsn
  }

  set {
    name  = "appConfig.grpc.host"
    value = var.grpc.host
  }

  set {
    name  = "appConfig.grpc.port"
    value = var.grpc.port
  }

  set {
    name  = "appConfig.secrets.hcaptcha_secret"
    value = var.hcaptcha_secret
  }

  set {
    name  = "apiDomainName"
    value = var.domain_name
  }

  set {
    name  = "appConfig.secrets.object_storage.endpoint"
    value = var.object_storage.endpoint
  }
  
  set {
    name  = "appConfig.secrets.object_storage.access_key"
    value = var.object_storage.access_key
  }

  set {
    name  = "appConfig.secrets.object_storage.secret_key"
    value = var.object_storage.secret_key
  }

}
