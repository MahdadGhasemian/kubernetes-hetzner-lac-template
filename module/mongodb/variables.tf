variable "release_name" {
  type        = string
  description = "Helm release name"
  default     = "mongodb"
}

variable "namespace" {
  description = "Namespace to install MongoDB chart into"
  type        = string
  default     = "mongodb"
}

variable "mongodb_chart_version" {
  description = "Version of MongoDB chart to install"
  type        = string
  default     = "14.7.0" # See https://artifacthub.io/packages/helm/bitnami/mongodb for latest version(s)
}

# Helm chart deployment can sometimes take longer than the default 5 minutes
variable "timeout_seconds" {
  type        = number
  description = "Helm chart deployment can sometimes take longer than the default 5 minutes. Set a custom timeout here."
  default     = 800 # 10 minutes
}

variable "values_file" {
  description = "The name of the MongoDB helm chart values file to use"
  type        = string
  default     = "values.yaml"
}

variable "architecture" {
  description = "This chart allows installing MongoDB(®) using two different architecture setups: standalone or replicaset. Use the architecture parameter to choose the one to use: standalone or replicaset"
  type        = string
  default     = "replicaset"
}

variable "mongodb_root_password" {
  description = "Root Password"
  type        = string
  default     = ""
}

variable "mongodb_storageclass_name" {
  description = "PVC Storage Class"
  type        = string
  default     = ""
}

variable "mongodb_storage_size" {
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
