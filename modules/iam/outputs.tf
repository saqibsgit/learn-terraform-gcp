output "service_account_email" {
  description = "Email of the service account created"
  value       = google_service_account.app_service_account.email
}