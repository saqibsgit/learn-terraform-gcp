resource "google_storage_bucket" "gcs_bucket" {
  name     = var.bucket_name
  location = var.location

  uniform_bucket_level_access = var.uniform_bucket_level_access

  public_access_prevention = "enforced"


  versioning {
    enabled = var.versioning_enabled
  }

  dynamic "encryption" {
    for_each = var.kms_key_name != "" ? [var.kms_key_name] : []
    content {
      default_kms_key_name = encryption.value
    }
  }

}