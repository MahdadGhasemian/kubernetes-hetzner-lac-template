# Hcloud
variable "hcloud_token" {
  sensitive = true
}

# Snapshot IDs
variable "microos_x86_snapshot_id" {
  description = "MicroOS x86 Snapshot ID"
  type        = string
  default     = ""
}

variable "microos_arm_snapshot_id" {
  description = "MicroOS ARM Snapshot ID"
  type        = string
  default     = ""
}

## ArgoCD
variable "argocd_admin_password" {
  description = "Agrocd Admin Password"
  type        = string
  default     = ""
}

# RabbitMQ
variable "rabbitmq_storageclass_name" {
  description = "RabbitMQ PVC Storage Classd"
  type        = string
  default     = ""
}

variable "rabbitmq_storage_size" {
  type        = string
  description = "PVC Storage Size"
  default     = "8Gi"
}

variable "rabbitmq_admin_password" {
  description = "User Password"
  type        = string
  default     = ""
}

# MongoDB
variable "mongodb_storageclass_name" {
  description = "MongoDB PVC Storage Classd"
  type        = string
  default     = ""
}

variable "mongodb_root_password" {
  description = "Root Password"
  type        = string
  default     = ""
}

variable "mongodb_storage_size" {
  type        = string
  description = "PVC Storage Size"
  default     = "8Gi"
}

# Prometheus
variable "prometheus_storageclass_name" {
  description = "PVC Storage Class"
  type        = string
  default     = ""
}

variable "prometheus_storage_size" {
  type        = string
  description = "PVC Storage Size"
  default     = "10Gi"
}

# Grafana
variable "grafana_storageclass_name" {
  description = "PVC Storage Class"
  type        = string
  default     = ""
}

variable "grafana_enable_persistence" {
  type        = bool
  description = "Enabled the persistence?"
  default     = false
}

variable "grafana_storage_size" {
  type        = string
  description = "PVC Storage Size"
  default     = "10Gi"
}

variable "grafana_admin_password" {
  description = "Default Admin Password"
  type        = string
  default     = ""
}

