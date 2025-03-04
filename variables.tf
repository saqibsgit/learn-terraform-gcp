variable "project_id" {
  type        = string
  description = "GCP project ID"
}

variable "env" {
  type        = string
  description = "The deployment environment (e.g., dev, prod)"
  default     = "dev" # You can change this to match your environment
}