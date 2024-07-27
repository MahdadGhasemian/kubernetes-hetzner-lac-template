# MongoDB Instance
module "mongodb" {
  providers = {
    helm = helm
  }

  source = "./module/mongodb"
  count  = 1
  tags = {
    Name       = "MongoDB"
    Created_by = "terraform"
  }

  mongodb_storageclass_name = var.mongodb_storageclass_name
  mongodb_root_password     = var.mongodb_root_password
  mongodb_storage_size      = var.mongodb_storage_size

  values_file = "values/bitnami-mongodb-default-values"

  depends_on = [module.kube-hetzner]
}

