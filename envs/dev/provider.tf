terraform {
  required_version = ">= 1.5.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 6.0.0"
    }
  }

  backend "gcs" {
    bucket = "terraform-state-bucket-474522"
    prefix = "env/dev"
  }
}


provider "google" {
  project = "proj-test-dev-474522"
  region  = "us-central1"

}
