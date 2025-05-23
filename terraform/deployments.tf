resource "kubernetes_deployment" "spring_boot_app" {
  metadata {
    name = "spring-boot-app"
    namespace = kubernetes_namespace.playground.metadata[0].name
    labels = {
      app = "spring-boot-app"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "spring-boot-app"
      }
    }

    template {
      metadata {
        labels = {
          app = "spring-boot-app"
        }
      }

      spec {
        container {
          name  = "spring-boot-container"
          image = "akaczmarek/spring-boot-docker:latest"

          port {
            container_port = 8080
          }

          env {
            name  = "SPRING_PROFILES_ACTIVE"
            value = "prod"
          }
        }
      }
    }
  }
}