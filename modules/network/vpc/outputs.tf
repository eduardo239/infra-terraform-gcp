output "vpc_network_id" {
  value = google_compute_network.vpc_network.id
}

output "vpc_network_self_link" {
  value       = google_compute_network.vpc_network.self_link
  description = "Self link da VPC para use em network_interface"
}
