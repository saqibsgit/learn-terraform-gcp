variable "bucket_name" {
  type        = string
  description = "GCS bucket name for storing data"

  validation {
    condition     = length(var.bucket_name) >= 5 && length(var.bucket_name) <= 63
    error_message = "Bucket name must be between 5 and 63 characters."
  }
}

variable "location" {
  type        = string
  description = "Location where bucket wil be created"
  default     = "EU"
}

variable "versioning_enabled" {
  type        = bool
  description = "Enable versioning for auditability"
  default     = true
}

variable "uniform_bucket_level_access" {
  type        = bool
  description = "Enable uniform bucket level access"
  default     = true
}

variable "kms_key_name" {
  type        = string
  description = "Optional KMS key for encryption. If empty, Google-managed keys are used"
  default     = ""
}