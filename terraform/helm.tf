resource "helm_release" "grafana_loki_stack" {
  name       = "gls"
  namespace  = kubernetes_namespace.monitoring.metadata[0].name
  repository = "https://grafana.github.io/helm-charts"
  chart      = "loki-stack"

  values = [
    file("${path.module}/configs/grafana-loki-stack-values.yml")
  ]
}