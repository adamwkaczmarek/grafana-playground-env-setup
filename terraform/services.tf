resource "kubernetes_service" "spring_boot_service" {
  metadata {
    name = "spring-boot-service"
    namespace = "playground"
  }

  spec {
    port {
      protocol    = "TCP"
      port        = 80
      target_port = "8080"
    }

    selector = {
      app = "spring-boot-app"
    }

    type = "ClusterIP"
  }
}

resource "kubernetes_service" "prometheus_service" {
  metadata {
    name      = "prometheus-service"
    namespace = "monitoring"
  }

  spec {
    port {
      protocol    = "TCP"
      port        = 80
      target_port = "9090"
    }

    selector = {
      app = "prometheus-server"
    }
  }
}
