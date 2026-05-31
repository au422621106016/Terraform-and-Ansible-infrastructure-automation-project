terraform {
  backend "s3" {
    bucket       = "jp-terraform-state-2026"
    key          = "infrastructure-automation/terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = true
    encrypt      = true
  }
}