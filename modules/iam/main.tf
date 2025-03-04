resource "google_service_account" "app_service_account" {
  account_id   = var.service_account_id
  display_name = "App Service Account"
}

resource "google_project_iam_binding" "storage_access" {
  project = var.project_id
  role    = "roles/storage.objectViewer"

  members = [
    "serviceAccount:${google_service_account.app_service_account.email}"
  ]
}

resource "google_project_iam_binding" "secrets_access" {
  project = var.project_id
  role    = "roles/secretmanager.secretAccessor"

  members = [
    "serviceAccount:${google_service_account.app_service_account.email}"
  ]
}