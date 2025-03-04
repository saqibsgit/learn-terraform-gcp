
# Adding backend to store the state file
terraform {
  backend "gcs" {
    bucket = "terraform-practice-452511-terraform-state"
    prefix = "terraform/state"
  }
}
resource "google_storage_bucket" "remote-state-bucket" {
  name                        = "terraform-practice-452511-terraform-state"
  location                    = "EU"
  uniform_bucket_level_access = true
}

# Using the network module to create dev vpc network
# define one public and one private subnet within vpc
# the module also creates a firewall rule for basic traffic 
module "network" {
  source                  = "./modules/network"
  vpc_name                = "vpc-dev"
  auto_create_subnetworks = false
  region                  = "europe-west3"
  public_subnet_cidr      = "10.0.1.0/24"
  private_subnet_cidr     = "10.0.2.0/24"
}

# Create a secure storage bucket using storage module
module "storage" {
  source                      = "./modules/storage"
  bucket_name                 = "terraform-practice-452511-secure-storage"
  location                    = "europe-west3"
  versioning_enabled          = true
  uniform_bucket_level_access = true
  kms_key_name                = "" #leaving empty to use google managed keys
}

# add least priviledge roles using iam module
module "iam" {
  source             = "./modules/iam"
  project_id         = "terraform-practice-452511"
  service_account_id = "app-service-account"
}

# using secrets modules which stores and retrieves secrets securely
data "google_secret_manager_secret_version" "secret" {
  secret = "my-app-${var.env}-secret"
}

module "secrets" {
  source                = "./modules/secrets"
  project_id            = var.project_id
  secret_name           = "my-app-${var.env}-secret"
  secret_id             = data.google_secret_manager_secret_version.secret.secret
  secret_value          = data.google_secret_manager_secret_version.secret.secret_data
  env                   = var.env
  service_account_email = module.iam.service_account_email
}

module "logging"{
  source = "./modules/logging"
  project_id = var.project_id
  log_sink_name = "audit-logs-sink"
  log_bucket_name = "audit-logs-bucket-${var.env}"
}