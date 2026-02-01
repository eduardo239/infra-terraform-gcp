output "subnet_self_link" {
  value       = google_compute_subnetwork.subnet.self_link
  description = "Self link da subnet para use em compute instance"
}
