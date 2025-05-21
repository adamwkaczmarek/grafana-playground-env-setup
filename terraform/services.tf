resource "kubernetes_service" "spring_boot_service" {
  metadata {
    name = "spring-boot-service"
    namespace = kubernetes_namespace.playground.metadata[0].name
  }

  spec {
    port {
      protocol    = "TCP"
      port        = 80
      target_port = 8080
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
    namespace = kubernetes_namespace.playground.metadata[0].name
  }

  spec {
    port {
      protocol    = "TCP"
      port        = 80
      target_port = 9090
    }

    selector = {
      app = "prometheus-server"
    }
  }
}

resource "kubernetes_service" "loki_service" {
  metadata {
    name      = "loki-service"
    namespace = kubernetes_namespace.playground.metadata[0].name
  }

  spec {
    selector = {
      app = "loki-server"
    }

    port {
      name       = "http"
      port       = 80
      target_port = 3100
    }
  }
}