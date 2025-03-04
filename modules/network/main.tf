resource "google_compute_network" "vpc_network" {
  name                    = var.vpc_name
  auto_create_subnetworks = var.auto_create_subnetworks
}

resource "google_compute_subnetwork" "public_subnet" {
  name          = "${var.vpc_name}-public-subnet"
  ip_cidr_range = var.public_subnet_cidr
  region        = var.region
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "private_subnet" {
  name          = "${var.vpc_name}-private-subnet"
  ip_cidr_range = var.private_subnet_cidr
  region        = var.region
  network       = google_compute_network.vpc_network.id
}

# Default firewall rule for basic traffic
resource "google_compute_firewall" "default" {
  name    = "${var.vpc_name}-default-firewall"
  network = google_compute_network.vpc_network.self_link

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "1000-2000"]
  }

  source_ranges = [var.vpc_cidr]
}