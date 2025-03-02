terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.23.0"
    }
  }
}

provider "google" {
  # Configuration options
  project = "terraform-practice-452511"
  region  = "europe-west3"
  zone    = "europe-west3-a"
}