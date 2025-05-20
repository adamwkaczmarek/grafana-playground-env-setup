resource "kubernetes_config_map" "prometheus_server_conf" {
  metadata {
    name      = "prometheus-server-conf"
    namespace = kubernetes_namespace.playground.metadata[0].name
  }

  data = {
    "prometheus.yml" = file("${path.module}/prometheus.yml") 
    }
}

resource "kubernetes_config_map" "loki_server_conf" {
  metadata {
    name      = "loki-server-conf"
    namespace = kubernetes_namespace.playground.metadata[0].name
  }

  data = {
    "loki.yml" = file("${path.module}/loki.yml")
    }
    
}

resource "kubernetes_config_map" "promtail_conf" {
  metadata {
    name      = "promtail-conf"
    namespace = kubernetes_namespace.playground.metadata[0].name
  }

  data = {
    "promtail.yml" = file("${path.module}/promtail.yml")
  }
}
