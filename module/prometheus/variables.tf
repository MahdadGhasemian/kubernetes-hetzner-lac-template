variable "release_name" {
  type        = string
  description = "Helm release name"
  default     = "prometheus"
}
variable "namespace" {
  description = "Namespace to install Prometheus chart into"
  type        = string
  default     = "prometheus"
}

variable "prometheus_chart_version" {
  description = "Version of Prometheus chart to install"
  type        = string
  default     = "25.10.0" # See https://artifacthub.io/packages/helm/prometheus-community/prometheus for latest version(s)
}

# Helm chart deployment can sometimes take longer than the default 5 minutes
variable "timeout_seconds" {
  type        = number
  description = "Helm chart deployment can sometimes take longer than the default 5 minutes. Set a custom timeout here."
  default     = 800 # 10 minutes
}

variable "values_file" {
  description = "The name of the Prometheus helm chart values file to use"
  type        = string
  default     = "values.yaml"
}

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

variable "tags" {
  type = object({
    Name       = string
    Created_by = string
  })
}
