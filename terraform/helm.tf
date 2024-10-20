resource "helm_release" "grafana" {
  name       = "grafana"
  chart      = "grafana"
  namespace  = "monitoring"
  repository = "https://grafana.github.io/helm-charts" 

#   values = [
#     file("values.yaml") # Optional: Specify custom values if you want to override the defaults
#   ]

  set {
    name  = "adminPassword"
    value = "admin"  # Set the Grafana admin password
  }

#   set {
#     name  = "service.type"
#     value = "ClusterIP"  # Can also be LoadBalancer or NodePort based on your needs
#   }

#   set {
#     name  = "persistence.enabled"
#     value = "true"  # Enable persistence for Grafana data
#   }

#   set {
#     name  = "persistence.size"
#     value = "10Gi"  # Specify the storage size
#   }
}
