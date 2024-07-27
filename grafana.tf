# Grafana
module "grafana" {
  providers = {
    helm = helm
  }

  source = "./module/grafana"
  count  = 1
  tags = {
    Name       = "Grafana"
    Created_by = "terraform"
  }

  grafana_storageclass_name = var.grafana_storageclass_name
  grafana_storage_size      = var.grafana_storage_size
  grafana_admin_password    = var.grafana_admin_password

  values_file = "values/grafana-default-values"

  depends_on = [module.kube-hetzner]
}
