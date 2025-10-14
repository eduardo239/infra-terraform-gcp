resource "google_service_account" "terraform" {
  account_id   = "terraform-sa"
  display_name = "Terraform Service Account"
}

resource "google_project_iam_member" "terraform_sa_owner" {
  project = var.project_id
  role    = "roles/editor"
  member  = "serviceAccount:${google_service_account.terraform.email}"
}

resource "google_project_iam_member" "terraform_sa_storage_admin" {
  project = var.project_id
  role    = "roles/storage.admin"
  member  = "serviceAccount:${google_service_account.terraform.email}"
}

resource "google_project_iam_custom_role" "terraform_minimal" {
  role_id     = "TERRAFORM_MINIMAL"
  title       = "Terraform Minimal Role"
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
    "resourcemanager.projectIamPolicy.get",
    "resourcemanager.projectIamPolicy.set",
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

