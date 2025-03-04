# create logging sink to capture audit logs
resource "google_logging_project_sink" "audit_logs_sink" {
  name        = var.log_sink_name
  project     = var.project_id
  destination = "storage.googleapis.com/${google_storage_bucket.audit_logs_bucket.name}"

  filter = <<EOT
  logName:("logs/cloudaudit.googleapis.com/activity" OR 
           "logs/cloudaudit.googleapis.com/system_event" OR 
           "logs/cloudaudit.googleapis.com/data_access")
  EOT

  unique_writer_identity = true
}

# Grant the log sink access to write to the GCS bucket
resource "google_storage_bucket_iam_member" "audit_logs_writer" {
  bucket = google_storage_bucket.audit_logs_bucket.name
  role   = "roles/storage.objectCreator"
  member = google_logging_project_sink.audit_logs_sink.writer_identity
}

# Create a storage bucket to store audit logs
resource "google_storage_bucket" "audit_logs_bucket" {
  name     = var.log_bucket_name
  project  = var.project_id
  location = "EU"

  uniform_bucket_level_access = true

  versioning {
    enabled = true
  }

  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      age = 30 # Delete logs older than 30 days
    }
  }
}
