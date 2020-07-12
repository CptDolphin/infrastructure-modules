# iam/outputs.tf

output "project_name" {
  value = var.project_name
}

output "region" {
  value = var.region
}

output "service_accounts" {
  value = [for sa in google_service_account.sa : sa.name]
}

output "custom-roles" {
  value = [for role in google_project_iam_custom_role.custom-roles : role.name]
}

output "custom_role_members" {
  value = [for role in google_project_iam_binding.custom_role_members : role.members]
}

output "predefined_role_members" {
  value = [for role in google_project_iam_binding.predefined_role_members : role.members]
}

