resource "kubernetes_namespace" "playground" {
  metadata {
    name = "playground"
  }
}

resource "kubernetes_namespace" "monitoring" {
  metadata {
    name = "monitoring"
  }
}