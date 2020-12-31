resource "helm_release" "casty-dash" {
  
  name        = "casty-dash"
  respository = "https://github.com/CastyLab/helm-charts"
  chart       = "casty/casty-dash"
  values      = [file("${path.module}/values.yaml")]
  timeout     = 600

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
    name  = "domainName"
    value = var.domain_name
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
    name  = "tls.dnsNames[0]"
    value = var.domain_name
  }

  set {
    name  = "tls.dnsNames[1]"
    value = "www.${var.domain_name}"
  }
  
}
