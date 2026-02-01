resource "google_storage_bucket" "bucket_simple" {
  name                        = var.bucket_name
  location                    = var.location
  force_destroy               = var.force_destroy
  uniform_bucket_level_access = true

  # Segurança: impede acesso público; use "inherited" apenas se necessário
  public_access_prevention = var.public_access_prevention

  # Recuperação e auditoria
  versioning {
    enabled = var.versioning_enabled
  }

}
