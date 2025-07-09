resource "kubernetes_deployment" "frontend" {
  metadata {
    name = "frontend"
    namespace = "dev"
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
          env_from {
            config_map_ref {
              name = var.nginx_configmap_name
            }
          }
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
        affinity {
          node_affinity {
            preferred_during_scheduling_ignored_during_execution {
              weight = 100
              preference {
                match_expressions {
                  key = "tier"
                  operator = "In"
                  values = ["frontend-backend"]
                }
              }
            }
          }
        }
        toleration {
          key = "tier"
          operator = "Equal"
          value = "frontend-backend"
          effect = "NoExecute"
        }
      } 
    } 
  } 
} 

resource "kubernetes_deployment" "backend" {
  metadata {
    name = "backend"
    namespace = "dev"
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
        affinity {
          node_affinity {
            preferred_during_scheduling_ignored_during_execution {
              weight = 100
              preference {
                match_expressions {
                  key = "tier"
                  operator = "In"
                  values = ["frontend-backend"]
                }
              }
            }
          }
        }
        toleration {
          key = "tier"
          operator = "Equal"
          value = "frontend-backend"
          effect = "NoExecute"
        }
      } 
    } 
  } 
} 

resource "kubernetes_deployment" "database" {
  metadata {
    name = "database"
    namespace = "dev"
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
              cpu = "1000m"
              memory = "512Mi"
            }
            requests = {
              cpu = "200m"
              memory = "128Mi"
            }
          }
        }
        affinity {
          node_affinity {
            preferred_during_scheduling_ignored_during_execution {
              weight = 100
              preference {
                match_expressions {
                  key = "tier"
                  operator = "In"
                  values = ["database"]
                }
              }
            }
          }
        }
        toleration {
          key = "tier"
          operator = "Equal"
          value = "database"
          effect = "NoExecute"
        }
      } 
    } 
  } 
} 
