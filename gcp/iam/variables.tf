# iam/variables.tf

variable "service_accounts" {
  type = string
}

variable "project_name" {
  type = string
}

variable "custom_roles" {
  type = string
}

variable "predefined_roles" {
  type = string
}

variable "region" {
  type = string
}

variable "zones" {
  type = list
}

variable "project_id" {
  type = string
}

