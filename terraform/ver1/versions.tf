terraform {
  required_version = ">= 0.12"

  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.39.0"
    }
    tls = {
      source = "hashicorp/tls"
      version = "~>3.0"
    }
  }
}
