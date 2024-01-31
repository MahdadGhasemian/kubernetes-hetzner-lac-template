variable "release_name" {
  type        = string
  description = "Helm release name"
  default     = "grafana"
}
variable "namespace" {
  description = "Namespace to install Grafana chart into"
  type        = string
  default     = "grafana"
}

variable "grafana_chart_version" {
  description = "Version of Grafana chart to install"
  type        = string
  default     = "7.2.4" # See https://artifacthub.io/packages/helm/grafana/grafana for latest version(s)
}

# Helm chart deployment can sometimes take longer than the default 5 minutes
variable "timeout_seconds" {
  type        = number
  description = "Helm chart deployment can sometimes take longer than the default 5 minutes. Set a custom timeout here."
  default     = 800 # 10 minutes
}

variable "values_file" {
  description = "The name of the Grafana helm chart values file to use"
  type        = string
  default     = "values.yaml"
}

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

variable "tags" {
  type = object({
    Name       = string
    Created_by = string
  })
}
