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

resource "kubernetes_deployment" "prometheus_server" {
  metadata {
    name      = "prometheus-server"
    namespace = kubernetes_namespace.playground.metadata[0].name
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "prometheus-server"
      }
    }

    template {
      metadata {
        labels = {
          app = "prometheus-server"
        }
      }

      spec {
        volume {
          name = "config-volume"

          config_map {
            name         = "prometheus-server-conf"
            default_mode = "0644"
          }
        }

        container {
          name  = "prometheus"
          image = "prom/prometheus"

          port {
            container_port = 9090
          }

          volume_mount {
            name       = "config-volume"
            mount_path = "/etc/prometheus"
          }
        }
      }
    }
  }

  depends_on = [kubernetes_config_map.prometheus_server_conf]
}

resource "kubernetes_deployment" "loki" {
  metadata {
    name      = "loki-server"
    namespace = kubernetes_namespace.playground.metadata[0].name
  }  
  
  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "loki-server"
      }
    }

    template {
      metadata {
        labels = {
          app = "loki-server"
        }
      }

      spec {
        volume {
          name = "config"

          config_map {
            name  = "loki-server-conf"
            default_mode = "0644"
          }
        }

        container {
          name  = "loki"
          image = "grafana/loki:latest"


          args = [
            "-config.file=/etc/loki/loki.yml"
          ]

          port {
            container_port = 3100
          }

          volume_mount {
            name       = "config"
            mount_path = "/etc/loki"
          }
        }
      }
    }
  }

  depends_on = [kubernetes_config_map.loki_server_conf]
}
