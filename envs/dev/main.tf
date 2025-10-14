resource "google_project_service" "apis" {
  for_each = toset(var.enabled_apis)
  project  = var.project_id
  service  = each.value
}

resource "random_integer" "suffix" {
  min = 10000
  max = 99999
}

module "vpc" {
  source               = "../../modules/network/vpc"
  project_id           = var.project_id
  network_name         = var.network_name
  subnet_name          = var.subnet_name
  region               = var.region
  subnet_ip_cidr_range = var.subnet_ip_cidr_range
}
module "subnet" {
  source               = "../../modules/network/subnet"
  network              = module.vpc.vpc_network_id
  subnet_name          = var.subnet_name
  region               = var.region
  subnet_ip_cidr_range = var.subnet_ip_cidr_range
  depends_on           = [module.vpc]
}
module "firewall" {
  source               = "../../modules/network/firewall"
  firewall_name        = var.firewall_name
  network_name         = module.vpc.vpc_network_id
  firewall_target_tags = var.firewall_target_tags
  depends_on           = [module.vpc]

}
# module "gcs_bucket" {
#   source        = "../../modules/storage/bucket"
#   bucket_name   = "${var.bucket_name}-${random_integer.suffix.result}"
#   location      = var.location
#   force_destroy = var.force_destroy
# }

# module "compute_instance" {
#   source                = "../../modules/compute/instance"
#   instance_name         = "${var.instance_name}-${random_integer.suffix.result}"
#   machine_type          = var.machine_type
#   zone                  = var.zone
#   compute_sa_account_id = var.compute_sa_account_id
# }

