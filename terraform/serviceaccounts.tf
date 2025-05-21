resource "kubernetes_service_account" "promtail_service_account" {
  metadata {
    name      = "promtail-service-account"
    namespace = kubernetes_namespace.playground.metadata[0].name
  }
}
#
# resource "kubernetes_secret" "sa_token" {
#   metadata {
#     name      = "my-sa-token"
#     namespace = "playground"
#     annotations = {
#       "kubernetes.io/service-account.name" = kubernetes_service_account.example.metadata[0].name
#     }
#   }
#
#   type = "kubernetes.io/service-account-token"
# }

resource "kubernetes_cluster_role_binding" "promtail_service_account_binding" {
  metadata {
    name = "promtail-account-admin-binding"
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "cluster-admin" # Be careful with full access
  }

  subject {
    kind      = "ServiceAccount"
    name      = kubernetes_service_account.promtail_service_account.metadata[0].name
    namespace = kubernetes_service_account.promtail_service_account.metadata[0].namespace
  }
}