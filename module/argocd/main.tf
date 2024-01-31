resource "helm_release" "argocd" {
  namespace        = var.namespace
  create_namespace = true
  name             = var.release_name
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  version          = var.argocd_chart_version

  # Helm chart deployment can sometimes take longer than the default 5 minutes
  timeout = var.timeout_seconds

  # If values file specified by the var.values_file input variable exists then apply the values from this file
  # else apply the default values from the chart
  values = [fileexists("${path.root}/${var.values_file}") == true ? file("${path.root}/${var.values_file}") : ""]


  # set_sensitive {
  #   name  = "configs.secret.argocdServerAdminPassword"
  #   value = var.admin_password == "" ? "" : bcrypt(var.admin_password)
  # }

  set {
    name  = "configs.params.server\\.insecure"
    value = var.insecure == false ? false : true
  }

  set {
    name  = "dex.enabled"
    value = var.enable_dex == true ? true : false
  }

  set {
    name = "global.nodeSelector.run"
    value = "application"
  }
}
