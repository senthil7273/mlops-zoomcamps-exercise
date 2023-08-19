resource "google_service_account" "mlops-sa" {
    project = var.project_id
    account_id = var.service_account_name
    display_name = "mlops-service-account"
}

resource "google_project_iam_binding" "ai-user" {
  project = var.project_id
  role = "roles/aiplatform.user"
  members = ["serviceAccount:${google_service_account.mlops-sa.email}"]
}

resource "google_project_iam_binding" "s3-view-file" {
  project = var.project_id
  role = "roles/storage.objectViewer"
  members = ["serviceAccount:${google_service_account.mlops-sa.email}"]
}

resource "google_project_iam_binding" "s3-create-file" {
  project = var.project_id
  role = "roles/storage.objectCreator"
  members = ["serviceAccount:${google_service_account.mlops-sa.email}"]
}

resource "google_project_iam_binding" "s3-admin" {
  project = var.project_id
  role = "roles/storage.objectAdmin"
  members = ["serviceAccount:${google_service_account.mlops-sa.email}"]
}