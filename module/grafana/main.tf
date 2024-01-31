resource "helm_release" "grafana" {
  namespace        = var.namespace
  create_namespace = true
  name             = var.release_name
  repository       = "https://grafana.github.io/helm-charts"
  chart            = "grafana"
  version          = var.grafana_chart_version

  # Helm chart deployment can sometimes take longer than the default 5 minutes
  timeout = var.timeout_seconds

  # If values file specified by the var.values_file input variable exists then apply the values from this file
  # else apply the default values from the chart
  values = [fileexists("${path.root}/${var.values_file}") == true ? file("${path.root}/${var.values_file}") : ""]

  set {
    name  = "persistence.enabled"
    value = true
  }

  set {
    name  = "persistence.storageClassName"
    value = var.grafana_storageclass_name
  }

  set {
    name  = "persistence.size"
    value = var.grafana_storage_size
  }

  set {
    name  = "adminPassword"
    value = var.grafana_admin_password
  }

  set {
    name = "nodeSelector.run"
    value = "packages"
  }
}
