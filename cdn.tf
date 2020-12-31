resource "helm_release" "casty-cdn" {
  
  name        = "casty-cdn"
  respository = "https://github.com/CastyLab/helm-charts"
  chart       = "casty/casty-cdn"
  values      = [file("${path.module}/resources/cdn_values.yaml")]

  depends_on = [
    helm_release.casty-api,
  ]

  set {
    name  = "replicaCount"
    value = 3
  }

  set {
    name = "image.tag"
    value = var.cdn.imageTag
  }
  
  set {
    name  = "ingressController"
    value = "nginx"
  }

  set {
    name  = "tls.dnsNames[0]"
    value = var.cdn.domain_name
  }

  set {
    name  = "domainName"
    value = var.cdn.domain_name
  }
  
  set {
    name  = "appConfig.app.debug"
    value = var.cdn.debug
  }

  set {
    name  = "appConfig.app.env"
    value = var.cdn.env
  }

  set {
    name  = "tls.enabled"
    value = var.cdn.tls_enabled
  }

  set {
    name  = "tls.caServer"
    value = var.cdn.tls_caServer
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
    name  = "appConfig.secrets.sentry_dsn"
    value = var.cdn.sentry_dsn
  }

  set {
    name  = "appConfig.secrets.object_storage.endpoint"
    value = var.object_storage.endpoint
  }
  
  #set {
    #name  = "appConfig.secrets.object_storage.region"
    #value = var.object_storage.region
  #}

  set {
    name  = "appConfig.secrets.object_storage.access_key"
    value = var.object_storage.access_key
  }

  set {
    name  = "appConfig.secrets.object_storage.secret_key"
    value = var.object_storage.secret_key
  }

}
