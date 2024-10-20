resource "kubernetes_config_map" "prometheus_server_conf" {
  metadata {
    name      = "prometheus-server-conf"
    namespace = "monitoring"
  }

  data = {
    "prometheus.yml" = "global:\n  scrape_interval: 15s\n  evaluation_interval: 15s\nscrape_configs:\n  - job_name: 'prometheus'\n    static_configs:\n      - targets: ['localhost:9090']\n"
  }
}
