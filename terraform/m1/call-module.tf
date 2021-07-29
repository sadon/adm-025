
provider "aws" {
  profile = "tf-training"
  region = "eu-central-1"
}

module "aws-vm" {
  source = "./vm"

  vm_name = "test"
  vm_type = "t2.nano"
  keypair_name = "test-terraform-module"
  ami = "ami-043097594a7df80ec"
}