# modules/dev/terragrunt.hcl

# Bucket is organization wide so even if you 
# have set different project you'll still send 
# the proper tfstate to proper bucket and get it back

remote_state {
  backend "gcs"
  config = {
    bucket = "terraform-admin-rwalas"
    prefix = "terraform/state"
  }
}
