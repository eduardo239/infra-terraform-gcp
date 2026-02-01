variable "bucket_name" {
  type        = string
  description = "Nome globalmente único do bucket GCS"
}

variable "location" {
  type        = string
  description = "Localização do bucket (região ou multi-region)"
}

variable "force_destroy" {
  type        = bool
  description = "Permitir destruir bucket com objetos (use false em produção)"
}

variable "public_access_prevention" {
  type        = string
  description = "Bloquear acesso público: enforced (recomendado) ou inherited"
  default     = "enforced"
}

variable "versioning_enabled" {
  type        = bool
  description = "Habilitar versionamento para recuperação e auditoria"
  default     = true
}

