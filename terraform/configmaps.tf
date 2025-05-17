resource "kubernetes_config_map" "prometheus_server_conf" {
  metadata {
    name      = "prometheus-server-conf"
    namespace = "playground"
  }

  data = {
    "prometheus.yml" = file("${path.module}/prometheus.yml") 
    }
}

resource "kubernetes_config_map" "loki_server_conf" {
  metadata {
    name      = "loki-server-conf"
    namespace = "playground"
  }

  data = {
    "loki.yaml" = file("${path.module}/loki.yaml") 
    }
    
}
