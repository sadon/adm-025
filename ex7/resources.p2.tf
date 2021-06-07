provider "aws" {
  profile = "tf-training"
  region = "eu-central-1"
}

resource "aws_instance" "web" {
  instance_type = "t2.nano"
  ami = "ami-043097594a7df80ec"
  tags = {
    Name: "test"
  }
}
