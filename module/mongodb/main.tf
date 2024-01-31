resource "helm_release" "mongodb" {
  namespace        = var.namespace
  create_namespace = true
  name             = var.release_name
  repository       = "https://charts.bitnami.com/bitnami"
  chart            = "mongodb"
  version          = var.mongodb_chart_version

  # Helm chart deployment can sometimes take longer than the default 5 minutes
  timeout = var.timeout_seconds

  # If values file specified by the var.values_file input variable exists then apply the values from this file
  # else apply the default values from the chart
  values = [fileexists("${path.root}/${var.values_file}") == true ? file("${path.root}/${var.values_file}") : ""]

  set {
    name  = "architecture"
    value = var.architecture
  }

  set {
    name  = "auth.rootPassword"
    value = var.mongodb_root_password
  }

  set {
    name  = "global.storageClass"
    value = var.mongodb_storageclass_name
  }

  set {
    name  = "persistence.size"
    value = var.mongodb_storage_size
  }

  set {
    name  = "nodeSelector.run"
    value = "packages"
  }

  set {
    name  = "arbiter.nodeSelector.run"
    value = "packages"
  }
}
