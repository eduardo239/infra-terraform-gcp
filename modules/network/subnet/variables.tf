variable "project_id" {
  type        = string
  description = "GCP Project ID"
}

variable "network" {
  type        = string
  description = "Self link ou ID da VPC"
}

variable "subnet_name" {
  type        = string
  description = "Nome da subnet"
}

variable "region" {
  type        = string
  description = "Região da subnet"
}

variable "subnet_ip_cidr_range" {
  type        = string
  description = "CIDR da subnet"
}

variable "private_ip_google_access" {
  type        = bool
  description = "Habilitar acesso privado a APIs Google (recomendado para VMs sem IP público)"
  default     = true
}
