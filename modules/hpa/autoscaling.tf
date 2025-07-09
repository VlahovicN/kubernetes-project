resource "kubernetes_manifest" "frontend_hpa" {
  manifest = {
    apiVersion = "autoscaling/v2"
    kind       = "HorizontalPodAutoscaler"
    metadata = {
      name      = "frontend-hpa"
      namespace = "dev"
    }
    spec = {
      scaleTargetRef = {
        apiVersion = "apps/v1"
        kind       = "Deployment"
        name       = "frontend"
      }
      minReplicas = 3
      maxReplicas = 7
      metrics = [
        {
          type = "Resource"
          resource = {
            name = "cpu"
            target = {
              type = "Utilization"
              averageUtilization = 50
            }
          }
        },
        {
          type = "Resource"
          resource = {
            name = "memory"
            target = {
              type = "Utilization"
              averageUtilization = 50
            }
          }
        }
      ]
    }
  }
  lifecycle {
    ignore_changes = [status]
  }
}



resource "kubernetes_manifest" "backend_hpa" {
  manifest = {
    apiVersion = "autoscaling/v2"
    kind       = "HorizontalPodAutoscaler"
    metadata = {
      name      = "backend-hpa"
      namespace = "dev"
    }
    spec = {
      scaleTargetRef = {
        apiVersion = "apps/v1"
        kind       = "Deployment"
        name       = "backend"
      }
      minReplicas = 3
      maxReplicas = 7
      metrics = [
        {
          type = "Resource"
          resource = {
            name = "cpu"
            target = {
              type = "Utilization"
              averageUtilization = 50
            }
          }
        },
        {
          type = "Resource"
          resource = {
            name = "memory"
            target = {
              type = "Utilization"
              averageUtilization = 50
            }
          }
        }
      ]
    }
  }
  lifecycle {
    ignore_changes = [status]
  }
}





resource "kubernetes_manifest" "vpa" {
  manifest = yamldecode(file("${path.module}/backendvpa.yaml"))

  lifecycle {
    ignore_changes = [status]
  }
}

