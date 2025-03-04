resource "google_secret_manager_secret" "secret" {
  name      = var.secret_name
  secret_id = var.secret_id
  project   = var.project_id

  replication {
    automatic = true #replicate secret accross different regions 
  }
}

resource "google_secret_manager_secret_version" "secret_version" {
  secret      = google_secret_manager_secret.secret.id
  secret_data = var.secret_value
}

# only privildeged roles can access the secret, in this case service account
resource "google_secret_manager_secret_iam_member" "secret_access" {
  secret_id = google_secret_manager_secret.secret.id
  role      = "roles/secretmanager.secretAccessor"

  member = "serviceAccount:${var.service_account_email}"
}

