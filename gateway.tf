resource "helm_release" "casty-gateway" {
  
  name        = "casty-gateway"
  respository = "https://github.com/CastyLab/helm-charts"
  chart       = "casty/casty-gateway"
  values      = [file("${path.module}/resources/gateway_values.yaml")]

  set {
    name  = "ingressController"
    value = "nginx"
  }
  
  set {
    name  = "image.tag"
    value = var.gateway.imageTag
  }

  set {
    name  = "userGatewayDomain"
    value = var.gateway.user_gateway_domain
  }

  set {
    name  = "theaterGatewayDomain"
    value = var.gateway.theater_gateway_domain
  }

  set {
    name  = "tls.dnsNames[0]"
    value = var.gateway.user_gateway_domain
  }

  set {
    name  = "tls.dnsNames[1]"
    value = var.gateway.theater_gateway_domain
  }

  set {
    name  = "appConfig.app.debug"
    value = var.gateway.debug
  }

  set {
    name  = "appConfig.app.env"
    value = var.gateway.env
  }

  set {
    name  = "tls.enabled"
    value = var.gateway.tls_enabled
  }

  set {
    name  = "tls.caServer"
    value = var.gateway.tls_caServer
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
    value = var.gateway.sentry_dsn
  }

  // Redis configuration
  set {
    name  = "appConfig.secrets.redis.replicaset"
    value = true
  }
  
  set {
    name  = "appConfig.secrets.redis.masterName"
    value = var.redis.masterName
  }

  set {
    name  = "appConfig.secrets.redis.sentinels[0]"
    value = "casty-redis.casty-redis.svc.cluster.local:26379"
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
    name  = "appConfig.secrets.redis.pass"
    value = var.redis.password
  }

  set {
    name  = "appConfig.secrets.redis.sentinel_pass"
    value = var.redis.password
  }

}
