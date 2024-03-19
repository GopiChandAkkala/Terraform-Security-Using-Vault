terraform {
  backend "s3" {
    bucket = "terraform-vault-integration"
    key    = "path/to/state.tf"
    region = "us-east-1"
  }
}
