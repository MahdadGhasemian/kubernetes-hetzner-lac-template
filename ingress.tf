# Traefik Dashboard ===============================================================================
resource "kubernetes_manifest" "traefik_dashboard_ingressroute" {
  manifest = {
    apiVersion = "traefik.io/v1alpha1",
    kind       = "IngressRoute",
    metadata = {
      name      = "traefik-dashboard",
      namespace = "traefik"
    },
    spec = {
      entryPoints = ["web", "websecure"],
      routes = [
        {
          kind  = "Rule",
          match = "Host(`${var.traefik_hostname}`)",
          services = [
            {
              name = "api@internal",
              kind = "TraefikService"
            }
          ]
        }
      ]
    }
  }

  depends_on = [module.kube-hetzner]
}

# Longhorn ========================================================================================
resource "kubernetes_manifest" "longhorn_dashboard_ingressroute" {
  manifest = {
    apiVersion = "traefik.io/v1alpha1",
    kind       = "IngressRoute",
    metadata = {
      name      = "longhorn-dashboard",
      namespace = "longhorn-system"
    },
    spec = {
      entryPoints = ["websecure"],
      routes = [
        {
          kind     = "Rule",
          match    = "Host(`${var.longhorn_hostname}`)",
          priority = 10
          services = [
            {
              name = "longhorn-frontend",
              port = 80
            }
          ]
        }
      ]
      tls = {
        certResolver = "default"
      }
    }
  }

  depends_on = [module.kube-hetzner]
}

# ArgoCD ==========================================================================================
resource "kubernetes_manifest" "argocd_ingressroute" {
  manifest = {
    apiVersion = "traefik.io/v1alpha1"
    kind       = "IngressRoute"
    metadata = {
      name      = "argocd-server"
      namespace = "argocd"
    }
    spec = {
      entryPoints = ["websecure"]
      routes = [
        {
          kind     = "Rule"
          match    = "Host(`${var.argocd_hostname}`)"
          priority = 10
          services = [
            {
              name = "argocd-server"
              port = 80
            }
          ]
        },
        {
          kind     = "Rule"
          match    = "Host(`${var.argocd_hostname}`) && Headers(`Content-Type`, `application/grpc`)"
          priority = 11
          services = [
            {
              name   = "argocd-server"
              port   = 80
              scheme = "h2c"
            }
          ]
        }
      ]
      tls = {
        certResolver = "default"
      }
    }
  }

  depends_on = [module.argocd]
}

# Prometheus ========================================================================================
resource "kubernetes_manifest" "prometheus_dashboard_ingressroute" {
  manifest = {
    apiVersion = "traefik.io/v1alpha1",
    kind       = "IngressRoute",
    metadata = {
      name      = "prometheus",
      namespace = "prometheus"
    },
    spec = {
      entryPoints = ["websecure"],
      routes = [
        {
          kind     = "Rule",
          match    = "Host(`${var.prometheus_hostname}`)",
          priority = 10
          services = [
            {
              name = "prometheus-server",
              port = 80
            }
          ]
        }
      ]
      tls = {
        certResolver = "default"
      }
    }
  }

  depends_on = [module.prometheus]
}

# Grafana ========================================================================================
resource "kubernetes_manifest" "grafana_dashboard_ingressroute" {
  manifest = {
    apiVersion = "traefik.io/v1alpha1",
    kind       = "IngressRoute",
    metadata = {
      name      = "grafana",
      namespace = "grafana"
    },
    spec = {
      entryPoints = ["websecure"],
      routes = [
        {
          kind     = "Rule",
          match    = "Host(`${var.grafana_hostname}`)",
          priority = 10
          services = [
            {
              name = "grafana",
              port = 80
            }
          ]
        }
      ]
      tls = {
        certResolver = "default"
      }
    }
  }

  depends_on = [module.grafana]
}
