1. Observe resources in **vm-plus-ssh.tf** file


2. Apply existing config
   
    Run `terraform init` command
   
    Run `terraform apply` command

   
3. Review objects properties:
   
   `terraform state list` 
   
   `terraform show`
 or
   just review state file

4. Write outputs for the objects
````
output "VM-name" {
value = aws_instance.web.tags.Name
}

output "VM-root-device" {
value = aws_instance.web.root_block_device
}

output "ip-address" {
value = aws_instance.web.private_ip
}

output "ssh-public-key" {
value = tls_private_key.tf-training.public_key_openssh
}
````

5. Review: type `terraform output`
````
OUTPUT HERE
````