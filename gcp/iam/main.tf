# iam/main.tf

terraform {
  # Intentionally empty. Will be filled by Terragrunt.
  backend "gcs" {}
}

## CREATE SERVICE ACCOUNTS
resource "google_service_account" "sa" {
  for_each     = jsondecode(var.service_accounts)
  account_id   = each.key
  display_name = each.value["display_name"]
  description  = each.value["description"]
}
## CREATE CUSTOM ROLES WITH PERMISSIONS
resource "google_project_iam_custom_role" "custom-roles" {
  for_each    = jsondecode(var.custom_roles)
  role_id     = each.key
  title       = each.value["title"]
  description = each.value["description"]
  permissions = each.value["permissions"]
}

## ADD SERVICE ACCOUNTS AND USERS TO CUSTOM ROLES
resource "google_project_iam_binding" "custom_role_members" {
  for_each = jsondecode(var.custom_roles)
  project  = var.project_name
  role     = "projects/${var.project_name}/roles/${each.key}"
  members  = concat(each.value["users"], each.value["sa"])
}

## ADD SERVICE ACCOUNTS AND USERS TO PREDEFINED ROLES
resource "google_project_iam_binding" "predefined_role_members" {
  for_each = jsondecode(var.predefined_roles)
  project  = var.project_name
  role     = "roles/${each.key}"
  members  = concat(each.value["users"], each.value["sa"])
}

