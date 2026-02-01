resource "google_project_service" "apis" {
  for_each = toset(var.enabled_apis)
  project  = var.project_id
  service  = each.value
}

resource "random_integer" "suffix" {
  min = 10000
  max = 99999
}
