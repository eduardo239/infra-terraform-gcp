# Create a Custom Role with minimal permissions for Terraform
resource "google_project_iam_custom_role" "terraform_minimal" {
  role_id     = "TERRAFORM_MINIMAL"
  title       = "TERRAFORM MINIMAL"
  description = "Minimal permissions for Terraform operations"
  project     = var.project_id
  permissions = [
    "storage.buckets.create",
    "storage.buckets.get",
    "storage.buckets.list",
    "storage.objects.create",
    "storage.objects.delete",
    "storage.objects.get",
    "storage.objects.list",
    "artifactregistry.repositories.downloadArtifacts",
    "compute.disks.create",
    "compute.instances.list",
    "compute.disks.setLabels",
    "compute.firewalls.create",
    "compute.firewalls.delete",
    "compute.firewalls.update",
    "compute.instances.create",
    "compute.instances.delete",
    "compute.instances.setLabels",
    "compute.instances.setMetadata",
    "compute.instances.setServiceAccount",
    "compute.instances.setTags",
    "compute.networks.get",
    "compute.subnetworks.get",
    "iam.serviceAccounts.create",
    "iam.serviceAccounts.delete",
    "iam.serviceAccounts.list",
    "serviceusage.services.disable",
    "serviceusage.services.enable",
    "serviceusage.services.get",
    "serviceusage.services.list",
    "serviceusage.services.use",
  ]
}

# Create a Service Account for Terraform
resource "google_service_account" "terraform" {
  account_id   = "terraform-sa-dev"
  display_name = "Terraform Service Account"
}

# Binding, assigning the Custom Role to the Service Account
resource "google_project_iam_member" "app_sa_custom_role" {
  project = var.project_id
  role    = "projects/${var.project_id}/roles/${google_project_iam_custom_role.terraform_minimal.role_id}"
  member  = "serviceAccount:${google_service_account.terraform.email}"
}

#
variable "roles" {
  type = list(string)
  default = [
    "roles/storage.admin",
    "roles/logging.viewer",
    "roles/monitoring.metricWriter"
  ]
}

resource "google_service_account" "app_sa" {
  account_id   = "app_service_account"
  display_name = "App Service Account"
}

resource "google_project_iam_member" "app_sa_roles" {
  for_each = toset(var.roles)

  project = var.project_id
  role    = each.key
  member  = "serviceAccount:${google_service_account.app_sa.email}"
}
