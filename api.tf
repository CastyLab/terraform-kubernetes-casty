resource "helm_release" "casty-api" {
  
  name        = "casty-api"
  respository = "https://github.com/CastyLab/helm-charts"
  chart       = "casty/casty-api"
  values      = [file("${path.module}/resources/api_values.yaml")]

  depends_on = [
    helm_release.casty-grpc,
  ]

  set {
    name  = "ingressController"
    value = "nginx"
  }

  set {
    name = "image.tag"
    value = var.api.imageTag
  }

  set {
    name  = "tls.dnsNames[0]"
    value = var.api.domain_name
  }

  set {
    name  = "domainName"
    value = var.api.domain_name
  }
  
  set {
    name  = "appConfig.app.debug"
    value = var.api.debug
  }

  set {
    name  = "appConfig.app.env"
    value = var.api.env
  }

  set {
    name  = "tls.enabled"
    value = var.api.tls_enabled
  }

  set {
    name  = "tls.caServer"
    value = var.api.tls_caServer
  }

  set {
    name  = "tls.email"
    value = var.tls_email
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
    value = var.api.access_control_allow_origin
  }

  set {
    name  = "appConfig.secrets.sentry_dsn"
    value = var.api.sentry_dsn
  }

  set {
    name  = "appConfig.grpc.host"
    value = "grpc.casty-grpc.svc.cluster.local"
  }

  set {
    name  = "appConfig.grpc.port"
    value = 55283
  }

  set {
    name  = "appConfig.secrets.hcaptcha_secret"
    value = var.hcaptcha_secret
  }

  set {
    name  = "apiDomainName"
    value = var.api.domain_name
  }

  set {
    name  = "cdn.persistence.storageClass"
    value = var.storageClass
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
