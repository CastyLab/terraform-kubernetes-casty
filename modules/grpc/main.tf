resource "helm_release" "casty-grpc" {
  
  name        = "casty-grpc"
  respository = "https://github.com/CastyLab/helm-charts"
  chart       = "casty/casty-grpc"
  values      = [file("${path.module}/values.yaml")]

  set {
    name  = "appConfig.app.debug"
    value = var.debug
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
    name  = "appConfig.app.env"
    value = var.env
  }

  set {
    name  = "appConfig.secrets.sentry_dsn"
    value = var.sentry_dsn
  }

  set {
    name  = "appConfig.secrets.hcaptcha_secret"
    value = var.hcaptcha_secret
  }

  // Mongodb Configurations
  set {
    name  = "appConfig.secrets.db.pass"
    value = var.mongodb.password
  }
  set {
    name  = "appConfig.secrets.db.user"
    value = var.mongodb.username
  }
  set {
    name = "appConfig.secrets.db.host"
    value = var.mongodb.host
  }
  set {
    name = "appConfig.secrets.db.port"
    value = var.mongodb.port
  }
  set {
    name = "appConfig.secrets.db.name"
    value = var.mongodb.database
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
    name  = "appConfig.secrets.redis.pass"
    value = var.redis.password
  }
  
  set {
    name  = "appConfig.secrets.redis.sentinel_pass"
    value = var.redis.password
  }

  // JWT secrets
  set {
    name  = "appConfig.secrets.jwt.access_token_secret"
    value = var.access_token_secret
  }

  set {
    name  = "appConfig.secrets.jwt.refresh_token_secret"
    value = var.refresh_token_secret
  }

  // Spotify oauth Config
  set {
    name  = "oauth.spotify.client_id"
    value = var.oauth_spotify_secret.client_id
  }
  set {
    name  = "oauth.spotify.client_secret"
    value = var.oauth_spotify_secret.client_secret
  }
  set {
    name  = "oauth.spotify.redirect_uri"
    value = var.oauth_spotify_secret.redirect_uri
  }

  // Discord oauth Config
  set {
    name  = "oauth.discord.client_id"
    value = var.oauth_discord_secret.client_id
  }
  set {
    name  = "oauth.discord.client_secret"
    value = var.oauth_discord_secret.client_secret
  }
  set {
    name  = "oauth.discord.redirect_uri"
    value = var.oauth_discord_secret.redirect_uri
  }

  // Google oauth Config
  set {
    name  = "oauth.google.client_id"
    value = var.oauth_google_secret.client_id
  }
  set {
    name  = "oauth.google.client_secret"
    value = var.oauth_google_secret.client_secret
  }
  set {
    name  = "oauth.google.redirect_uri"
    value = var.oauth_google_secret.redirect_uri
  }
  set {
    name  = "oauth.google.project_id"
    value = var.oauth_google_secret.project_id
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
