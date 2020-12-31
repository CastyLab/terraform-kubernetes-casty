resource "helm_release" "casty-dash" {
  
  name        = "casty-dash"
  respository = "https://github.com/CastyLab/helm-charts"
  chart       = "casty/casty-dash"
  values      = [file("${path.module}/resources/dash_values.yaml")]
  timeout     = 600

  depends_on = [
    helm_release.casty-api,
    helm_release.casty-gateway,
  ]

  set {
    name  = "ingressController"
    value = var.ingressController
  }

  set {
    name = "image.tag"
    value = var.dashboard.imageTag
  }
  
  set {
    name  = "domainName"
    value = var.dashboard.domain_name
  }

  set {
    name  = "tls.enabled"
    value = var.dashboard.tls_enabled
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
    name  = "tls.dnsNames[0]"
    value = var.dashboard.domain_name
  }

  set {
    name  = "tls.dnsNames[1]"
    value = "www.${var.dashboard.domain_name}"
  }
  
}
