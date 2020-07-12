output "vpc_name" {
  value = module.vpc_name.name
}
#output "subnet_cidr" {
#  value = module.subnet_cidr[*].id
#}
#output "pod_range" {
#  value = module.pod_range[*].id
#}
#output "service_range" {
#  value = module.service_range[*].id
#}
#output "cloud_nat_ips" {
#  value = module.cloud_nat_ips[*].id
#}
#output "firewall_ports" {
#  value = module.firewall_ports[*].id
#}
