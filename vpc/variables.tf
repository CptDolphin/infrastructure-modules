# dev/vpc/variables.tf

variable "vpc_name" { 
  type = string 
}
variable "cluster_name" { 
  type = string 
}
variable "firewall_ports" { 
  type = list 
}
variable "subnet_cidr" { 
  type = string 
}
variable "pod_range" { 
  type = list 
}
variable "service_range" { 
  type = list 
}
variable "network_tags" { 
  type = list 
}
variable "cloud_nat_ips" { 
  type = list 
}
variable "project_id" { 
  type = string 
}
variable "region" { 
  type = string 
}
