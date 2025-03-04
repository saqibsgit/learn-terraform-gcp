output "secret_name" {
  description = "The name of the created secret"
  value       = google_secret_manager_secret.secret.name
}

output "secret_id" {
  description = "The id of the created secret"
  value       = google_secret_manager_secret.secret.id
}