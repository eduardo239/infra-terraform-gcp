resource "google_service_account" "default" {
  account_id   = var.compute_sa_account_id
  display_name = "Custom SA for VM Instance"
}

resource "google_compute_instance" "default" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone
  project      = var.project_id

  tags = var.tags

  # Imagem: use família com patch automático; evite imagem fixa desatualizada
  boot_disk {
    initialize_params {
      image = var.boot_image
    }
    auto_delete = true
  }

  # Rede: use VPC dedicada (não default); IP público apenas se explicitamente habilitado
  network_interface {
    network    = var.network_self_link
    subnetwork = var.subnet_self_link

    dynamic "access_config" {
      for_each = var.enable_public_ip ? [1] : []
      content {
        # Ephemeral public IP apenas quando necessário
      }
    }
  }

  # Princípio do menor privilégio: sem cloud-platform; permissões via IAM na SA
  service_account {
    email  = google_service_account.default.email
    scopes = var.service_account_scopes
  }

  # Segurança: desabilitar serial port e metadata legada quando possível
  metadata = var.metadata

  shielded_instance_config {
    enable_secure_boot          = var.enable_secure_boot
    enable_vtpm                 = true
    enable_integrity_monitoring = true
  }

  allow_stopping_for_update = true
}
