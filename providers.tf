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
}

provider "vault" {
  # Configuration options
}