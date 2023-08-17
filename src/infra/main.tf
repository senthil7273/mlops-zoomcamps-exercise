provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

# disabled featurestore creation
# module "featurestore" {
#   source = "./modules/featurestore"
# }

module "storage" {
  source = "./modules/storage"
}

module "api-permission" {
  source = "./modules/api-permission"
}

module "account" {
  source = "./modules/account"
}