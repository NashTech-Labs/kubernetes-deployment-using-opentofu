resource "kubernetes_deployment" "nginx" {
  metadata {
    name = "nginx-app"
    labels = {
      App = "nginx-app"
    }
  }

  spec {
    replicas = 2
    selector {
      match_labels = {
        App = "nginx-app"
      }
    }
    template {
      metadata {
        labels = {
          App = "nginx-app"
        }
      }
      spec {
        container {
          image = "nginx:1.7.8"
          name  = "nginx"

          port {
            container_port = 80
          }

          resources {
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "50Mi"
            }
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "nginx-service"{
  metadata {
    name = "nginx-app-service"
    labels = {
      App = "ScalableNginxExample"
    }
  }
  spec{
    selector={
      App = kubernetes_deployment.nginx.metadata.0.labels.App
    }
    port{
      port = 80
      target_port = 80
    }
    type = "ClusterIP"
  }

}