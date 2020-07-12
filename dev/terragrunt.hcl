# dev/terragrunt.hcl

# Bucket is organization wide so even if you 
# have set different project you'll still send 
# the proper tfstate to proper bucket and get it back

generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
provider "google" {
  credentials = file(var.credentials)
  project     = var.project_name
  region      = var.region
}
EOF
}

