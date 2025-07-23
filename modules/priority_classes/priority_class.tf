resource "kubernetes_priority_class" "frontendbackend" {
  metadata {
    name = "frontendbackend"
  }

  value = 1000
}


resource "kubernetes_priority_class" "database" {
  metadata {
    name = "database"
  }

  value = 100000
}