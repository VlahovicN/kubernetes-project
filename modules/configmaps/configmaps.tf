resource "kubernetes_config_map" "nginx" {
  metadata {
    name = "nginx"
    namespace = "dev"
    labels = {
      app = "myapp"
      tier = "frontend"
    }
  }
  data = {
    ENVIRONMENT = "development"
    APP_VERSION = "v1.0.0"
  }
}