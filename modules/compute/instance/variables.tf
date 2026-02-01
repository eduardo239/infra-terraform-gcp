variable "project_id" {
  type        = string
  description = "GCP Project ID"
}

variable "compute_sa_account_id" {
  type        = string
  description = "ID da Service Account da instância (sem @...)"
}

variable "instance_name" {
  type        = string
  description = "Nome da instância"
}

variable "machine_type" {
  type        = string
  description = "Tipo de máquina (ex.: e2-medium)"
  default     = "e2-medium"
}

variable "zone" {
  type        = string
  description = "Zona da instância"
}

variable "boot_image" {
  type        = string
  description = "Imagem ou família do boot disk (ex.: debian-cloud/debian-12)"
  default     = "debian-cloud/debian-12"
}

variable "network_self_link" {
  type        = string
  description = "Self link da VPC (evite usar default)"
}

variable "subnet_self_link" {
  type        = string
  description = "Self link da subnet"
}

variable "enable_public_ip" {
  type        = bool
  description = "Atribuir IP público (use false quando possível)"
  default     = false
}

# Menor privilégio: apenas escopos necessários; evite cloud-platform
variable "service_account_scopes" {
  type        = list(string)
  description = "Escopos OAuth2 da SA (ex.: [\"cloud-platform\"] ou escopos específicos)"
  default     = ["https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/monitoring.write"]
}

variable "tags" {
  type        = list(string)
  description = "Tags de rede para firewall"
  default     = []
}

variable "metadata" {
  type        = map(string)
  description = "Metadados da instância"
  default     = {}
}

variable "enable_secure_boot" {
  type        = bool
  description = "Habilitar Secure Boot"
  default     = false
}
