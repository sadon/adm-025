resource "tls_private_key" "tf-training" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "random_string" "suffix" {
  length = 10
  special = false
  upper = false
}

resource "aws_key_pair" "tf-training" {
  key_name = "luxoft-adm025-training-debug-ex-${random_string.suffix.result}"
  public_key = tls_private_key.tf-training.public_key_openssh

}

