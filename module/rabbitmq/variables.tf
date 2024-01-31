variable "release_name" {
  type        = string
  description = "Helm release name"
  default     = "rabbitmq"
}
variable "namespace" {
  description = "Namespace to install RabbitMQ chart into"
  type        = string
  default     = "rabbitmq"
}

variable "rabbitmq_chart_version" {
  description = "Version of RabbitMQ chart to install"
  type        = string
  default     = "12.6.1" # See https://artifacthub.io/packages/helm/bitnami/rabbitmq for latest version(s)
}

# Helm chart deployment can sometimes take longer than the default 5 minutes
variable "timeout_seconds" {
  type        = number
  description = "Helm chart deployment can sometimes take longer than the default 5 minutes. Set a custom timeout here."
  default     = 800 # 10 minutes
}

variable "values_file" {
  description = "The name of the RabbitMQ helm chart values file to use"
  type        = string
  default     = "values.yaml"
}

variable "rabbitmq_admin_password" {
  description = "User Password"
  type        = string
  default     = ""
}

variable "rabbitmq_storageclass_name" {
  description = "PVC Storage Class"
  type        = string
  default     = ""
}

variable "rabbitmq_storage_size" {
  type        = string
  description = "PVC Storage Size"
  default     = "8Gi"
}

variable "tags" {
  type = object({
    Name       = string
    Created_by = string
  })
}
