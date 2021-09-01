1. Create file with next content:
````
# resources.tf
resource "tls_private_key" "tf-training" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "tf-training" {
  key_name = "tf-training-ver-key"
  public_key = tls_private_key.tf-training.public_key_openssh
}
````

2. Add versions constrains:
````
# versions.tf
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
````