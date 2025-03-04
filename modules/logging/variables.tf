variable "project_id" {
  type        = string
  description = "The GCP project ID"
}

variable "log_sink_name" {
  type        = string
  description = "Name of the logging sink"
  default     = "audit-logs-sink"
}

variable "log_bucket_name" {
  type        = string
  description = "GCS bucket name for storing logs"
  default     = "audit-logs-bucket"
}