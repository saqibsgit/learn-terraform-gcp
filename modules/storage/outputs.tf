output "bucket_name" {
  description = "The name of the created GCS bucket"
  value       = google_storage_bucket.gcs_bucket.name
}

output "bucket_self_link" {
  description = "The self link of the created GCS bucket."
  value       = google_storage_bucket.gcs_bucket.self_link
}