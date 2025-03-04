
# Adding backend to store the state file
terraform {
    backend "local"{
        path = "./terraform.tfstate"
    }
}
resource "google_storage_bucket" "remote-state-bucket"{
    name = "terraform-practice-452511-terraform-state"
    location = "EU"
     uniform_bucket_level_access = true
}