resource "google_service_account" "mlops-sa" {
    account_id = "mlops-sa"
    display_name = "mlops-service-account"
}

resource "google_project_iam_binding" "ai-user" {
  role = "aiplatform.user"
  members = [google_service_account.mlops-sa]
}

resource "google_project_iam_binding" "s3-view-file" {
  role = "storage.objectViewer"
  members = [google_service_account.mlops-sa]
}

resource "google_project_iam_binding" "s3-create-file" {
  role = "storage.objectCreator"
  members = [google_service_account.mlops-sa]
}

resource "google_project_iam_binding" "s3-admin" {
  role = "storage.objectAdmin"
  members = [google_service_account.mlops-sa]
}