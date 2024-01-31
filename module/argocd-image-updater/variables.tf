variable "release_name" {
  type        = string
  description = "Helm release name"
  default     = "argocd-image-updater"
}
variable "namespace" {
  description = "Namespace to install ArgoCD Image Updater chart into"
  type        = string
  default     = "argocd"
}

variable "argocd_image_updater_chart_version" {
  description = "Version of ArgoCD Image Updater chart to install"
  type        = string
  default     = "0.9.1" # See https://artifacthub.io/packages/helm/argo/argocd-image-updater for latest version(s)
}

variable "values_file" {
  description = "The name of the ArgoCD Image Updater helm chart values file to use"
  type        = string
  default     = "values.yaml"
}

variable "tags" {
  type = object({
    Name       = string
    Created_by = string
  })
}
