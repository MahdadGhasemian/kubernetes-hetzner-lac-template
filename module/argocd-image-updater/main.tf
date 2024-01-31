resource "helm_release" "argocd-image-updater" {
  namespace        = var.namespace
  create_namespace = true
  name             = var.release_name
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argocd-image-updater"
  version          = var.argocd_image_updater_chart_version

  # If values file specified by the var.values_file input variable exists then apply the values from this file
  # else apply the default values from the chart
  values = [fileexists("${path.root}/${var.values_file}") == true ? file("${path.root}/${var.values_file}") : ""]

  set {
    name = "nodeSelector.run"
    value = "application"
  }
}
