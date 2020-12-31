resource "helm_release" "casty-grpc" {
  
  name        = "casty-grpc"
  respository = "https://github.com/CastyLab/helm-charts"
  chart       = "casty/casty-grpc"
  values      = [file("${path.module}/resources/grpc_values.yaml")]

  set {
    name  = "appConfig.app.debug"
    value = var.grpc.debug
  }

  set {
    name = "image.tag"
    value = var.grpc.imageTag
  }
  
  set {
    name  = "appConfig.app.env"
    value = var.grpc.env
  }

  set {
    name  = "appConfig.secrets.sentry_dsn"
    value = var.grpc.sentry_dsn
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
    value = "casty-mongodb.casty-mongodb.svc.cluster.local"
  }
  set {
    name = "appConfig.secrets.db.port"
    value = 27017
  }
  set {
    name = "appConfig.secrets.db.name"
    value = "casty"
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
    value = var.grpc.access_token_secret
  }

  set {
    name  = "appConfig.secrets.jwt.refresh_token_secret"
    value = var.grpc.refresh_token_secret
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
