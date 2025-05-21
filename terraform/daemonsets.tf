resource "kubernetes_daemonset" "promtail" {
  metadata {
    name      = "promtail"
    namespace = kubernetes_namespace.playground.metadata[0].name
    labels = {
      app = "promtail"
    }
  }

  spec {
    selector {
      match_labels = {
        app = "promtail"
      }
    }

    template {
      metadata {
        labels = {
          app = "promtail"
        }
      }

      spec {
        service_account_name = "promtail-service-account"

        container {
          name  = "promtail"
          image = "grafana/promtail:latest"

          args = ["-config.file=/etc/promtail/promtail.yml"]

          port {
            container_port = 9080
          }

          volume_mount {
            name       = "config"
            mount_path = "/etc/promtail"
          }

          volume_mount {
            name       = "varlogcontainers"
            mount_path = "/var/log/containers"
          }

          volume_mount {
            name       = "varlogpods"
            mount_path = "/var/log/pods"
          }

          volume_mount {
            name       = "positions"
            mount_path = "/tmp"
          }

          volume_mount {
            name       = "dockerlog"
            mount_path = "/var/lib/docker/containers"
            read_only  = true
          }
        }

        volume {
          name = "config"

          config_map {
            name = "promtail-conf"
            default_mode = "0644"
          }
        }

        volume {
          name = "varlogcontainers"

          host_path {
            path = "/var/log/containers"
          }
        }

        volume {
          name = "varlogpods"

          host_path {
            path = "/var/log/pods"
          }
        }

        volume {
          name = "positions"

          empty_dir {}
        }

        volume {
          name = "dockerlog"
          host_path {
            path = "/var/lib/docker/containers"
          }
        }
      }
    }
  }

  depends_on = [kubernetes_config_map.promtail_conf]
}