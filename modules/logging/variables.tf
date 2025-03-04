variable "project_id" {
  type        = string
  description = "The GCP project ID"
}

variable "log_bucket_name" {
  type        = string
  description = "GCS bucket name for storing audit logs"

  validation {
    condition     = length(var.log_bucket_name) >= 5
    error_message = "Log bucket name must be at least 5 characters long."
  }
}

variable "log_sink_name" {
  type        = string
  description = "The name of the logging sink"

  validation {
    condition     = length(var.log_sink_name) >= 5
    error_message = "Log sink name must be at least 5 characters long."
  }
}