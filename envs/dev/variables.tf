variable "project_id" {
  type        = string
  description = "GCP Project ID. Sobrescreva via TF_VAR_project_id ou terraform.tfvars.json (não commite valores reais)."
  default     = "change-me-dev-123456"
  validation {
    condition     = can(regex("^[a-z][a-z0-9-]{4,28}[a-z0-9]$", var.project_id))
    error_message = "project_id deve ser 6-30 caracteres, minúsculas, números e hífens."
  }
}

variable "region" {
  type        = string
  description = "Região GCP padrão"
  default     = "us-central1"
  validation {
    condition     = can(regex("^[a-z]+-[a-z]+[0-9]*$", var.region))
    error_message = "region deve ser um identificador válido (ex: us-central1)."
  }
}

variable "enabled_apis" {
  type        = list(string)
  description = "APIs do Google Cloud a serem habilitadas no projeto"
  default = [
    "storage.googleapis.com",
    "iam.googleapis.com",
    "compute.googleapis.com",
    "cloudresourcemanager.googleapis.com"
  ]
}

# # Cloud Storage
# variable "bucket_name" { type = string }
# variable "location" { type = string }
# variable "force_destroy" { type = bool }
# # Compute Engine
# variable "compute_sa_account_id" { type = string }
# variable "instance_name" { type = string }
# variable "machine_type" { type = string }
# variable "zone" { type = string }
# # VPC Network
# variable "network_name" { type = string }
# variable "subnet_name" { type = string }
# variable "subnet_ip_cidr_range" { type = string }
# variable "firewall_name" { type = string }
# variable "firewall_target_tags" { type = list(string) }
