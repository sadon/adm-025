. Prepare minimal module structure
````
$ mkdir m1
$ cd m1
$ touch README.md main.tf variables.tf outputs.tf
````

2. Prepare input params:
````
# variables.tf
variable "vm_type" {}
variable "ami" {}
variable "keypair_name" {}
variable "vm_name" {}
```` 

3. Create calling module file , like below:
````
# call-module.tfmodule "aws-vm" {
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
````

4. Prepare main module functionality:
````
# m1/main.tf
resource "aws_instance" "web" {
  depends_on = [aws_key_pair.tf-training]
  instance_type = var.vm_type
  ami = var.ami
  key_name = var.keypair_name
  tags = {
    Name: var.vm_name
  }
}

resource "tls_private_key" "tf-training" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "tf-training" {
  key_name   = var.keypair_name
  public_key = tls_private_key.tf-training.public_key_openssh
}
````

5. Try to spin up the resources:

Run `terraform init` command

Run `terraform apply` command

Destroy, in case of successful VM creation: `terraform destroy`

6. Extend variables definition
   and add validation blocks, according the exercise:
````
# variables.tf
...
variable "vm_type" {
  type = string
  validation {
    condition     = length(var.vm_type) > 3
    error_message = "Instance type name must be a string more than symbols."
  }
}

variable "ami" {
  type = string
  validation {
    condition     = can(regex("^ami\\-[0-9a-f]+$", var.ami))
    error_message = "Ami ID is incorrect. Valid example: 'ami-043097594a7df80ec'."
  }
}
````

7. Fill up README.md for the vm module:

Note: external utilities like `terraform-docs could help with automatically documentation creation:

`terraform-docs markdown ./ > README.md`

Example: [./readme-example.png](./readme-example.png)

8. Create output block in the module's outputs.tf:
````
output "ssh-public-key" {
  value = tls_private_key.tf-training.public_key_openssh
}
output "vm-id" {
  value = aws_instance.web.id
}
````

8. Destroy infrastructure:

Run `terraform destroy`