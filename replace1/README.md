1. Prepare simple ec2 config in **vm-plus-ssh.tf** file
````
resource "aws_instance" "web" {
  instance_type = "t2.nano"
  ami           = "ami-043097594a7df80ec"
  
}
````

2. Generate and link SSH-keys for the VM:
````
resource "tls_private_key" "tf-training" {
  algorithm = "RSA"
  rsa_bits  = 4096

}

resource "aws_key_pair" "tf-training" {
  key_name   = "tf-training-key"
  public_key = tls_private_key.tf-training.public_key_openssh
}

````

add 
`key_name      = aws_key_pair.tf-training.key_name` for VM

3. Run plan and check syntax:
   
Run `terraform init` command

Run `terraform plan` command
 
4. Apply
   Run `terraform apply` command
   
5. So, It's time to replace ssh-key

Option 1:
   
   `terraform taint tls_private_key.tf-training`

   Expected:
   >   Resource instance tls_private_key.tf-training has been marked as tainted. 
   
Run `terraform apply` command

Expected:
>Plan: 2 to add, 0 to change, 2 to destroy

Option 2:

`terraform apply -replace="tls_private_key.tf-training"`

Expected:
> Apply complete! Resources: 2 added, 0 changed, 2 destroyed.

6. Destroy infrastructure:

Run `terraform destroy`