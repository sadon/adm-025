resource "tls_private_key" "tf-training" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "tf-training" {
  key_name = "tf-training-ver-key"
  public_key = tls_private_key.tf-training.public_key_openssh

}

