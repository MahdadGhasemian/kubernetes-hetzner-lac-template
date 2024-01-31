# Prometheus
module "prometheus" {
  providers = {
    helm = helm
  }

  source = "./module/prometheus"
  count  = 1
  tags = {
    Name       = "Prometheus"
    Created_by = "terraform"
  }

  prometheus_storageclass_name = var.prometheus_storageclass_name
  prometheus_storage_size      = var.prometheus_storage_size

  values_file = "values/prometheus-default-values"

  depends_on = [module.kube-hetzner]
}

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
