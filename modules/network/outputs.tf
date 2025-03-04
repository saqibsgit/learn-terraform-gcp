output "netowrk_name" {
  description = "The name of the VPC network"
  value       = google_compute_network.vpc_network.name
}

output "netowrk_self_link" {
  description = "The self link of the vpc network"
  value       = google_compute_network.vpc_network.netowrk_self_link
}