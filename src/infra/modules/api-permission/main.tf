resource "google_project_service" "compute-permission" {
  service = "compute.googleapis.com"
  disable_on_destroy = true
}

resource "google_project_service" "resource-manager-permission" {
  service = "cloudresourcemanager.googleapis.com"
  disable_on_destroy = true
}
resource "google_project_service" "gcr-permission" {
  service = "containerregistry.googleapis.com"
  disable_on_destroy = true
}

resource "google_project_service" "iam-permission" {
  service = "iam.googleapis.com"
  disable_on_destroy = true
}

resource "google_project_service" "ai-platform-permission" {
  service = "aiplatform.googleapis.com"
  disable_on_destroy = true
}

resource "google_project_service" "cloud-build-permission" {
  service = "cloudbuild.googleapis.com"
  disable_on_destroy = true
}

resource "google_project_service" "cloud-function-permission" {
  service = "cloudfunctions.googleapis.com"
  disable_on_destroy = true
}