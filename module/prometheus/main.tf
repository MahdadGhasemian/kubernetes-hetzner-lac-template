resource "helm_release" "prometheus" {
  namespace        = var.namespace
  create_namespace = true
  name             = var.release_name
  repository       = "https://prometheus-community.github.io/helm-charts"
  chart            = "prometheus"
  version          = var.prometheus_chart_version

  # Helm chart deployment can sometimes take longer than the default 5 minutes
  timeout = var.timeout_seconds

  # If values file specified by the var.values_file input variable exists then apply the values from this file
  # else apply the default values from the chart
  values = [fileexists("${path.root}/${var.values_file}") == true ? file("${path.root}/${var.values_file}") : ""]

  set {
    name  = "server.persistentVolume.storageClass"
    value = var.prometheus_storageclass_name
  }

  set {
    name  = "server.persistentVolume.size"
    value = var.prometheus_storage_size
  }

  set {
    name = "nodeSelector.run"
    value = "packages"
  }
}
