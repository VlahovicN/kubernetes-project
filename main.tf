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
  nginx_configmap_name = module.configmaps.nginx_configmap_name
  database_secret_name = module.secrets.database_secret_name
  priority_class_frontendbackend = module.priorityclasses.priority_class_frontendbackend
  priority_class_database = module.priorityclasses.priority_class_database
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


########## ConfigMaps ############
module "configmaps" {
  source = "./modules/configmaps"
}

########## Secrets #############
module "secrets" {
  source = "./modules/secrets"
}

######## PriorityClasses ########
module "priorityclasses" {
  source = "./modules/priority_classes"
}


