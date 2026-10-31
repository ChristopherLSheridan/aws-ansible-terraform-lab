terraform {
  backend "s3" {
    bucket       = "terraform-gitops-state-844274145888"
    key          = "terraform.tfstate"
    region       = "us-east-2"
    encrypt      = true
    use_lockfile = true
  }
}
