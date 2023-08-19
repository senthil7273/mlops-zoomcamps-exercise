resource "google_storage_bucket" "training-data-bucket" {
    name = "training-data-mlzoomcamp"
    location = var.bucket_region
    force_destroy = true
}

resource "google_storage_bucket" "ml-staging-bucket" {
    name = "ml-staging-mlzoomcamp"
    location = var.bucket_region
    force_destroy = true
}

resource "google_storage_bucket" "tf-staging-bucket" {
    name = "iac-mlops-mlzoomcamp"
    location = var.bucket_region
    force_destroy = true
}