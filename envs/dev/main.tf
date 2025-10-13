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

resource "random_integer" "suffix" {
  min = 10000
  max = 99999
}

module "gcs_bucket" {
  source        = "../../modules/storage/buckets"
  bucket_name   = "${var.bucket_name}-${random_integer.suffix.result}"
  location      = var.location
  force_destroy = var.force_destroy
}


module "gcs_bucket_2" {
  source        = "../../modules/storage/buckets"
  bucket_name   = "${var.bucket_name}-${random_integer.suffix.result}-2"
  location      = var.location
  force_destroy = var.force_destroy
}

module "gcs_bucket_3" {
  source        = "../../modules/storage/buckets"
  bucket_name   = "${var.bucket_name}-${random_integer.suffix.result}-2"
  location      = var.location
  force_destroy = var.force_destroy
}
