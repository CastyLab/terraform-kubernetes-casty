resource "helm_release" "casty-gateway" {
  
  name        = "casty-gateway"
  respository = "https://github.com/CastyLab/helm-charts"
  chart       = "casty/casty-gateway"
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
    name  = "image.tag"
    value = var.image.tag
  }

  set {
    name  = "userGatewayDomain"
    value = var.user_gateway_domain
  }

  set {
    name  = "theaterGatewayDomain"
    value = var.theater_gateway_domain
  }

  set {
    name  = "tls.dnsNames[0]"
    value = var.user_gateway_domain
  }

  set {
    name  = "tls.dnsNames[1]"
    value = var.theater_gateway_domain
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
    name  = "appConfig.secrets.sentry_dsn"
    value = var.sentry_dsn
  }

  // Redis configuration
  set {
    name  = "appConfig.secrets.redis.replicaset"
    value = var.redis.replicaset
  }
  
  set {
    name  = "appConfig.secrets.redis.masterName"
    value = var.redis.master_name
  }

  set {
    name  = "appConfig.secrets.redis.sentinels[0]"
    value = "${var.redis.host}:${var.redis.port}"
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
    name  = "appConfig.secrets.redis.pass"
    value = var.redis.password
  }

  set {
    name  = "appConfig.secrets.redis.sentinel_pass"
    value = var.redis.password
  }

}
