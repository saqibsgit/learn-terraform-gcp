
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
module "network" {
  source                  = "./modules/network"
  vpc_name                = "vpc-dev"
  auto_create_subnetworks = true
}