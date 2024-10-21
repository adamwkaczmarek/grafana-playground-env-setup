resource "kubernetes_config_map" "prometheus_server_conf" {
  metadata {
    name      = "prometheus-server-conf"
    namespace = "playground"
  }

  data = {
    "prometheus.yml" = file("${path.module}/prometheus.yml") 
    }
}
