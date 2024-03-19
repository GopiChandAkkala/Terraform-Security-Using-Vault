terraform {
  required_providers {
    vault = {
      source = "hashicorp/vault"
      version = "4.0.0"
    }
  }
}
provider "vault" {
  address = "http://127.0.0.1:8200"
}
provider "aws" {
  region   = "us-east-1"
  access_key = data.vault_generic_secret.aws_creds.data["aws_access_key_id"]
  secret_key = data.vault_generic_secret.aws_creds.data["aws_secret_access_key"]
  }
