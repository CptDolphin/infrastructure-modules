# vpc/outputs.tf

  output "vpc_name" {
~   value = google_compute_network.project-network.name
_ }

+ output "subnets_for" {
+   value = [ for key, value
+             in google_compute_subnetwork.project-subnet
+             : "${value.name}: ${value.ip_cidr_range}" ]
+ }
+
+ #output "pod_range" {
+ #  value = [ for firewall in google_compute_firewall.project-firewall-allow-ssh : firewall ]
+ #}
+ #output "service_range" {
+ #  value = [ for firewall in google_compute_firewall.allow-db : firewall ]
+ #}
+
+ output "cloud_nat_ips" {
+   value = [ for key, value
+             in google_compute_address.project-nat-ips
+             : "${value.name}: ${value.address}"]
+ }

