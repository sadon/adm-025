resource "aws_instance" "web" {
  instance_type = var.vm_type
  ami = var.ami
  key_name = aws_key_pair.tf-training.key_name
  tags = {
    Name: var.vm_name
  }
}

resource "tls_private_key" "tf-training" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "tf-training" {
  key_name = var.keypair_name
  public_key = tls_private_key.tf-training.public_key_openssh

}

