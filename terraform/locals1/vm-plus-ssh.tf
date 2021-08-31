locals {
  default_tags = {
    "owner" : "Luxoft"
    "seminar-id" : "adm-025"
  }
}

resource "random_string" "suffix" {
  length = 10
  special = false
  upper = false
}

resource "aws_instance" "web" {
  instance_type = "t2.nano"
  ami           = "ami-043097594a7df80ec"
  key_name      = aws_key_pair.tf-training.key_name
  tags = merge(
    local.default_tags,
    {
      Name : "EC2 of Firstname Lastname"
    }
  )
}

resource "tls_private_key" "tf-training" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "tf-training" {
  key_name   = "tf-training-key-${random_string.suffix.result}"
  public_key = tls_private_key.tf-training.public_key_openssh
  tags = merge(
    local.default_tags,
    {
      Name : "Firstname Lastname ec2 key"
    }
  )
}

