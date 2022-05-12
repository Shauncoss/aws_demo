terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.53.0"
    }
    vault = {
      source  = "hashicorp/vault"
      version = "2.22.1"
    }
  }
}

provider "aws" {
  region     = var.region
  access_key = data.vault_aws_access_credentials.aws_creds.access_key
  secret_key = data.vault_aws_access_credentials.aws_creds.secret_key
}

provider "vault" {
  address = <URL>
  #add_address_to_env = true
  auth_login {
    path      = "auth/userpass/login/${var.username}"
    namespace = var.vault_namespace
    parameters = {
      password = var.password
    }
  }
}
