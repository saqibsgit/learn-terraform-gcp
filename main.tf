
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