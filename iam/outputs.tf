# dev/iam/outputs.tf

#output "all_create_service_accounts" {
#  value = google_service_account.sa[*].name
#}

output "creds" {
  value = var.credentials
}

output "project_name" {
  value = var.project_name
}

output "region" {
  value = var.region
}

#output "custom-roles" {
#  value = google_project_iam_custom_role.custom-roles[*].name
#}
#
#output "custom_role_members" {
#  value = google_project_iam_binding.custom_role_members[*].name
#}
#
#output "predefined_role_members" {
#  value = google_project_iam_binding.predefined_role_members[*].name
#}

