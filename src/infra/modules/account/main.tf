resource "google_service_account" "mlops-sa" {
    account_id = "mlops-sa"
    display_name = "mlops-service-account"
}

resource "google_project_iam_binding" "project" {
  role = "aiplatform.user"
  members = [google_service_account.mlops-sa]
}

resource "google_project_iam_binding" "project" {
  role = "storage.objectViewer"
  members = [google_service_account.mlops-sa]
}

resource "google_project_iam_binding" "project" {
  role = "storage.objectCreator"
  members = [google_service_account.mlops-sa]
}

resource "google_project_iam_binding" "project" {
  role = "storage.objectAdmin"
  members = [google_service_account.mlops-sa]
}