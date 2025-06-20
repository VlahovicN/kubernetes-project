resource "kubernetes_service" "frontend" {
  metadata {
    name = "frontend"
    labels = {
      app = "myapp"
      tier = "frontend"
    }
  }
  spec {
    selector = {
      app = "myapp"
      tier = "frontend"
    }
    type = "ClusterIP"

    port {
      port = 80
      target_port = 80
    }
  }
}


resource "kubernetes_service" "backend" {
  metadata {
    name = "backend"
    labels = {
      app = "myapp"
      tier = "backend"
    }
  }
  spec {
    selector = {
      app = "myapp"
      tier = "backend"
    }
    type = "ClusterIP"

    port {
      port = 80
      target_port = 80
    }
  }
}



resource "kubernetes_service" "database" {
  metadata {
    name = "database"
    labels = {
      app = "myapp"
      tier = "database"
    }
  }
  spec {
    selector = {
      app = "myapp"
      tier = "database"
    }
    type = "ClusterIP"

    port {
      port = 6379
      target_port = 6379
    }
  }
}


resource "kubernetes_service" "frontend_nodeport" {
  metadata {
    name = "frontend-nodeport"
    labels = {
      app = "myapp"
      tier = "frontend"
    }
  }
spec {
  selector = {
    app = "myapp"
    tier = "frontend"
  }
  type = "NodePort"

  port {
    port = 80
    target_port = 80
    node_port = 30080
  }
}
}