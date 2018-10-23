# API api.tf
#
# This file contains the resources needed to create a k8s environment for the API
#

resource "kubernetes_namespace" "api" {
  metadata {
    name = "api-${var.environment}"
  }
}

resource "kubernetes_replication_controller" "api" {
  metadata {
    name = "api"
    namespace = "api-${var.environment}"
    labels {
      app = "api"
    }
  }

  spec {
    replicas = 1

    selector = {
      app = "api"
    }

    template {
      container {
        image = "nightowlmatt/json-server"
        name  = "api"

        port {
          container_port = 80
        }

        resources {
          requests {
            cpu    = "100m"
            memory = "100Mi"
          }
          limits {
            cpu    = "200m"
            memory = "200Mi"
          }
        }
      }
    }
  }
}

resource "kubernetes_horizontal_pod_autoscaler" "api" {
  metadata {
    name      = "api"
    namespace = "api-${var.environment}"
  }
  spec {
    min_replicas = 1
    max_replicas = 5
    target_cpu_utilization_percentage = 5
    scale_target_ref {
      kind = "ReplicationController"
      name = "api"
    }
  }
}

resource "kubernetes_service" "api" {
  metadata {
    name      = "api"
    namespace = "api-${var.environment}"
    labels {
      app = "api"
    }
  }

  spec {
    selector {
      app = "api"
    }
    port {
      port = 80
      target_port = 80
    }

    type = "LoadBalancer"
  }
}
