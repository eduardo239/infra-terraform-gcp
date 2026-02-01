resource "google_compute_subnetwork" "subnet" {
  name          = var.subnet_name
  ip_cidr_range = var.subnet_ip_cidr_range
  region        = var.region
  network       = var.network
  project       = var.project_id

  # Acesso privado a APIs Google (ex.: GCS, BigQuery) sem IP público
  private_ip_google_access = var.private_ip_google_access
}
