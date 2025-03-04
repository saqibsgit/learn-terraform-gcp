output "netowrk_name" {
  description = "The name of the VPC network"
  value       = google_compute_network.vpc_network.name
}
#use this when needed
output "network_self_link" {
  description = "The self link of the VPC network"
  value       = google_compute_network.vpc_network.self_link
}
