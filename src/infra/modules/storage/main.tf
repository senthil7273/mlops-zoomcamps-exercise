resource "google_storage_bucket" "training-data-bucket" {
    name = "training-data"
    force_destroy = true
}

resource "google_storage_bucket" "ml-staging-bucket" {
    name = "ml-staging"
    force_destroy = true
}

resource "google_storage_bucket" "tf-staging-bucket" {
    name = "iac-mlops"
    force_destroy = true
}