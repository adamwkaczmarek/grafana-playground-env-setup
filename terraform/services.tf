resource "kubernetes_service" "spring_boot_service" {
  metadata {
    name = "spring-boot-app"
    namespace = kubernetes_namespace.playground.metadata[0].name
  }

  spec {
    port {
      protocol    = "TCP"
      port        = 8080
      target_port = 8080
    }

    selector = {
      app = "spring-boot-app"
    }

    type = "ClusterIP"
  }
}