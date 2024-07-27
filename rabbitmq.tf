# RabbitMQ Instance
module "rabbitmq" {
  providers = {
    helm = helm
  }

  source = "./module/rabbitmq"
  count  = 1
  tags = {
    Name       = "RabbitMQ"
    Created_by = "terraform"
  }

  rabbitmq_storageclass_name = var.rabbitmq_storageclass_name
  rabbitmq_admin_password    = var.rabbitmq_admin_password
  rabbitmq_storage_size      = var.rabbitmq_storage_size

  values_file = "values/bitnami-rabbitmq-default-values"

  depends_on = [module.kube-hetzner]
}
