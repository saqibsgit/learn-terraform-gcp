variable "bucket_name" {
  type        = string
  description = "The name of the cloud storage bucket"
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