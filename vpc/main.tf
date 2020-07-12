# dev/vpc/main.tf

terraform {
  ## Intentionally empty. Will be filled by Terragrunt.
  backend "gcs" {}
}

resource "google_compute_network" "project-network" {
  name                    = "${var.vpc_name}-network"
  auto_create_subnetworks = "false"
  routing_mode            = "REGIONAL"
}

resource "google_compute_subnetwork" "project-subnet" {
  name                     = var.cluster_name
  region                   = var.region
  ip_cidr_range            = var.subnet_cidr
  private_ip_google_access = true
  network                  = google_compute_network.project-network.id
}

resource "google_compute_firewall" "project-firewall-allow-ssh" {
  name    = "${var.vpc_name}-allow-something"
  network = google_compute_network.project-network.self_link
  allow {
    protocol = "tcp"
    ports    = var.firewall_ports
  }
  #source_ranges = ["IP/range"] #according to cidr notation
  #source_ranges = [var.subnet_cidr, var.pod_range, var.service_range]
}

resource "google_compute_firewall" "allow-db" {
  name    = "allow-from-${var.cluster_name}-cluster-to-other-project-db"
  network = google_compute_network.project-network.self_link
  allow {
    protocol = "icmp"
    ports    = var.firewall_ports
  }
  allow {
    protocol = "tcp"
    ports    = var.firewall_ports
  }
  #  source_ranges = [concat(var.subnet_cidr, var.pod_range)]
  target_tags = var.network_tags
}

resource "google_compute_address" "project-nat-ips" {
  count   = length(var.cloud_nat_ips)
  name    = var.cloud_nat_ips[count.index]
  project = var.project_id
  region  = var.region
}

