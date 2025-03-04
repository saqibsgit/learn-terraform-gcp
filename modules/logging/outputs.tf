output "log_sink_name" {
  description = "The name of the audit log sink"
  value       = google_logging_project_sink.audit_logs_sink.name
}

output "log_bucket_name" {
  description = "The name of the storage bucket where logs are stored"
  value       = google_storage_bucket.audit_logs_bucket.name
}