
resource "random_integer" "suffix" {
  min = 10000
  max = 99999
}

# module "gcs_bucket" {
#   source        = "../../modules/storage/buckets"
#   bucket_name   = "${var.bucket_name}-${random_integer.suffix.result}"
#   location      = var.location
#   force_destroy = var.force_destroy
# }
