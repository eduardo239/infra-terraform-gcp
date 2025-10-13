resource "google_project_service" "apis" {
  for_each = toset(var.enabled_apis)
  project  = var.project_id
  service  = each.value
}

resource "random_integer" "suffix" {
  min = 10000
  max = 99999
}

# module "gcs_bucket" {
#   source        = "../../modules/storage/bucket"
#   bucket_name   = "${var.bucket_name}-${random_integer.suffix.result}"
#   location      = var.location
#   force_destroy = var.force_destroy
# }

module "compute_instance" {
  source                = "../../modules/compute/instance"
  instance_name         = "${var.instance_name}-${random_integer.suffix.result}"
  machine_type          = var.machine_type
  zone                  = var.zone
  compute_sa_account_id = var.compute_sa_account_id
}

