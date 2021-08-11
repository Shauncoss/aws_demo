terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.53.0"
    }
    vault = {
      source = "hashicorp/vault"
      version = "2.22.1"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  access_key = "${data.vault_aws_access_credentials.aws_creds.access_key}"
  secret_key = "${data.vault_aws_access_credentials.aws_creds.secret_key}"
}

provider "vault" {
  address = "https://vault-cluster.vault.35108500-544b-45ec-b6a4-6230edfe5841.aws.hashicorp.cloud:8200"
  #add_address_to_env = true
  auth_login {
    path = "auth/userpass/login/${var.username}"
    namespace = "admin/aws/demo/"
    parameters = {
      password = "awsdemopw123"
    }
  }
}