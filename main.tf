terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.37.1"
    }
  }
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}


######### DEPLOYMENTS ##############

module "deployments" {
  source = "./modules/deployments"
}

########## SERVICES ############

module "services" {
  source = "./modules/services"
}


########## NAMESPACES ###########

resource "kubernetes_namespace" "dev" {
  metadata {
    name = "dev"
  }
}