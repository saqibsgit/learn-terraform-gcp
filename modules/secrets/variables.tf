variable "project_id" {
  type        = string
  description = "GCP project id"
}
variable "secret_name" {
  type        = string
  description = "Name of the secret"
}
variable "secret_id" {
  description = "The id of the created secret"
  type        = string
}
variable "secret_value" {
  type        = string
  description = "The sesitive data that needs to be stored in the secret"
  sensitive   = true
}
variable "env" {
  type        = string
  description = "The deployment environment"
}
variable "service_account_email" {
  type        = string
  description = "The service account email that should access the secret"
}