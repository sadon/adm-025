provider "aws" {
  profile = "tf-training"
  region = "eu-central-1"
}

resource "aws_instance" "web" {
  instance_type = "t2.nano"
  ami = "ami-043097594a7df80ec"
  key_name = aws_key_pair.tf-training.key_name
  tags = {
    Name: "test"
  }
}

resource "tls_private_key" "tf-training" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "tf-training" {
  key_name = "tf-training-key"
  public_key = tls_private_key.tf-training.public_key_openssh

}

output "VM-name" {
  value = aws_instance.web.tags.Name
}

output "ip-address" {
  value = aws_instance.web.private_ip
}