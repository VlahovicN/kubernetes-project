output "priority_class_frontendbackend" {
  value = kubernetes_priority_class.frontendbackend.metadata[0].name
}

output "priority_class_database" {
  value = kubernetes_priority_class.database.metadata[0].name
}