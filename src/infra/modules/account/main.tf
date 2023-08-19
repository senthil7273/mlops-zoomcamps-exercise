resource "google_service_account" "mlops-sa" {
    project = var.project_id
    account_id = "mlops-sa"
    display_name = "mlops-service-account"
}

resource "google_project_iam_binding" "ai-user" {
  project = var.project_id
  role = "aiplatform.user"
  members = [google_service_account.mlops-sa]
}

resource "google_project_iam_binding" "s3-view-file" {
  project = var.project_id
  role = "storage.objectViewer"
  members = [google_service_account.mlops-sa]
}

resource "google_project_iam_binding" "s3-create-file" {
  project = var.project_id
  role = "storage.objectCreator"
  members = [google_service_account.mlops-sa]
}

resource "google_project_iam_binding" "s3-admin" {
  project = var.project_id
  role = "storage.objectAdmin"
  members = [google_service_account.mlops-sa]
}