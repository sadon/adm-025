resource "random_string" "suffix" {
  length = 10
  special = false
  upper = false
}

resource "aws_instance" "ssh-example" {
  instance_type = "t2.nano"
  ami = "ami-043097594a7df80ec"
  key_name = aws_key_pair.tf-training.key_name
  tags = {
    Name: "adm-025 VM"
    exercise: "ec2-ssh"
  }
  vpc_security_group_ids = [aws_security_group.inbound-22.id]
}

resource "aws_security_group" "inbound-22" {
  ingress {
    from_port = 22
    protocol = "tcp"
    to_port = 22
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 22
    protocol = "tcp"
    to_port = 22
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "tls_private_key" "tf-training" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "tf-training" {
  key_name   = "tf-training-key-${random_string.suffix.result}"
  public_key = tls_private_key.tf-training.public_key_openssh
}

