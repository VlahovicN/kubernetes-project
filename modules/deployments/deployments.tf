resource "kubernetes_deployment" "frontend" {
  metadata {
    name = "frontend"
    labels = {
      app = "myapp"
      tier = "frontend"
    }
  }

spec {
  replicas = 3
  selector {
    match_labels = {
      app = "myapp"
      tier = "frontend"
    }
  }
  template {
    metadata {
      labels = {
        app = "myapp"
        tier = "frontend"
      }
    }
    spec {
      container {
        image = "nginx:latest"
        name = "nginx"

        resources {
          limits = {
            cpu = "500m"
            memory = "256Mi"
          }
          requests = {
            cpu = "200m"
            memory = "128Mi"
          }
        }
      }
    }
  }
}
}




resource "kubernetes_deployment" "backend" {
  metadata {
    name = "backend"
    labels = {
      app = "myapp"
      tier = "backend"
    }
  }

spec {
  replicas = 3
  selector {
    match_labels = {
      app = "myapp"
      tier = "backend"
    }
  }
  template {
    metadata {
      labels = {
        app = "myapp"
        tier = "backend"
      }
    }
    spec {
      container {
        image = "httpd:latest"
        name = "apache"

        resources {
          limits = {
            cpu = "500m"
            memory = "256Mi"
          }
          requests = {
            cpu = "200m"
            memory = "128Mi"
          }
        }
      }
    }
  }
}
}



resource "kubernetes_deployment" "database" {
  metadata {
    name = "database"
    labels = {
      app = "myapp"
      tier = "database"
    }
  }

spec {
  replicas = 3
  selector {
    match_labels = {
      app = "myapp"
      tier = "database"
    }
  }
  
template {
  metadata {
    labels = {
      app = "myapp"
      tier = "database"
    }
  }

  spec {
    container {
      image = "redis:latest"
      name = "redis"
      resources {
        limits = {
          cpu = "500m"
          memory = "256Mi"
        }
        requests = {
          cpu = "200m"
          memory = "128Mi"
        }
      }
    }
  }
}
}
}
