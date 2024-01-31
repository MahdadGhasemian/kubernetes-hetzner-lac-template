# ArgoCD
module "argocd" {
  providers = {
    helm = helm
  }

  source = "./module/argocd"
  count  = 1
  tags = {
    Name       = "Argocd"
    Created_by = "terraform"
  }

  insecure = true
  # admin_password = var.argocd_admin_password

  values_file = "values/argocd-default-values.yaml"

  depends_on = [module.kube-hetzner]
}

# ArgoCD Image Updater
module "argocd-image-updater" {
  providers = {
    helm = helm
  }

  source = "./module/argocd-image-updater"
  count  = 1
  tags = {
    Name       = "ArgoCdImageUpdater"
    Created_by = "terraform"
  }

  values_file = "values/argocd-image-updater-default-values.yaml"

  depends_on = [module.kube-hetzner]
}
