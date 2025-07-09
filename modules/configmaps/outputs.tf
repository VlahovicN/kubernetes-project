output "nginx_configmap_name" {
  value = kubernetes_config_map.nginx.metadata[0].name
}

output "nginx_configmap_namespace" {
  value = kubernetes_config_map.nginx.metadata[0].namespace
}