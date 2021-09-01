module "aws-vm" {
  source = "./vm"

  vm_name = "test"
  vm_type = "t2.nano"
  keypair_name = "luxoft-adm025-m1-${random_string.random-suffix.result}"
  ami = "ami-043097594a7df80ec"
}

resource "random_string" "random-suffix" {
  length = 10
  upper = false
  special = false
}

output "ssh-key" {
  value = module.aws-vm.ssh-public-key
}