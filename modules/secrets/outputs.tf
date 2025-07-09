output "database_secret_name" {
  value = kubernetes_secret.database.metadata[0].name
}