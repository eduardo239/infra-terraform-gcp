locals {
  allow_rules = {
    "ssh"  = { ports = ["22"], source = "203.0.113.0/24" }
    "http" = { ports = ["80"], source = "203.0.113.0/24" }
  }
  deny_rules = {
    "all" = { ports = ["0-65535"], source = "0.0.0.0/0" }
  }
}


resource "google_compute_firewall" "allow_rules" {
  for_each = local.allow_rules

  name      = "allow-${each.key}"
  network   = var.network_name
  direction = "INGRESS"
  priority  = 1000

  allow {
    protocol = "tcp"
    ports    = each.value.ports
  }

  source_ranges = [each.value.source]
  target_tags   = var.firewall_target_tags
}

resource "google_compute_firewall" "deny_rules" {
  for_each = local.deny_rules

  name      = "deny-${each.key}"
  network   = var.network_name
  direction = "INGRESS"
  priority  = 1000

  deny {
    protocol = "tcp"
    ports    = each.value.ports
  }

  source_ranges = [each.value.source]
  target_tags   = var.firewall_target_tags
}
