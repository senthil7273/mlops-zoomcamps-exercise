provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

module "featurestore" {
  source = "./modules/featurestore"
  region = var.region
}