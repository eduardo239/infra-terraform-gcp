variable "enabled_apis" {
  type = list(string)
  default = [
    "storage.googleapis.com",
    "iam.googleapis.com",
    "compute.googleapis.com"
  ]
}

resource "google_project_service" "apis" {
  for_each = toset(var.enabled_apis)
  project  = var.project_id
  service  = each.value
}
