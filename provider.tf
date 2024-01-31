terraform {
  required_version = ">= 1.5.0"
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "1.45.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.0.1"
    }
  }
}

# Hetzner Cloud Provider
provider "hcloud" {
  token = var.hcloud_token
}

# Helm Provider
provider "helm" {
  kubernetes {
    config_path = "./k3s_kubeconfig.yaml"
  }
}
