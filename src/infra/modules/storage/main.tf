resource "google_storage_bucket" "training-data-bucket" {
    name = "training-data"
    location = var.bucket_region
    force_destroy = true
}

resource "google_storage_bucket" "ml-staging-bucket" {
    name = "ml-staging"
    location = var.bucket_region
    force_destroy = true
}

resource "google_storage_bucket" "tf-staging-bucket" {
    name = "iac-mlops"
    location = var.bucket_region
    force_destroy = true
}