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
value = aws_instance.web.public_ip
}

output "ssh-public-key" {
value = tls_private_key.tf-training.public_key_openssh
}
````

5. Review: type `terraform output` example
````
VM-name = "test"
VM-root-device = tolist([
  {
    "delete_on_termination" = true
    "device_name" = "/dev/xvda"
    "encrypted" = false
    "iops" = 100
    "kms_key_id" = ""
    "tags" = tomap({})
    "throughput" = 0
    "volume_id" = "vol-03855d9606a81a19a"
    "volume_size" = 8
    "volume_type" = "gp2"
  },
])
ip-address = "3.70.19.7"
ssh-public-key = <<EOT
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDapwf5KQPXp8pum3bq3Ema5QTP4lRwid0Bd0OL6sfSmGF5aB0pLWqjcGyGkq6Vvej7zofrXOWckZ/auAcv7BZTS0WofkNeUVUrfha56dIlMHW7NRI372Ukit1AJFBSXHj4vGadQsiY4hhWhrrNQznnT5Ja2dyam1qnFHVNGbdySYxMqN4wzrdyqz8r5taHUhxfIBvLX45ix2YKSmJ8ChHKSBDSL4aHtIe1Phh6J3kgk85/Px59jUT1wjaTu4Z1KCc3G16tiD0YvYmO/JcvzCUSI8XmOMWybQcDLI1li9OjHfNgCNn10OcPsw1gQupUCODbDQQVsnSs078CYL2X1PV0HQIjdYDSkXhm1rMWWgYxNYmDjMduIEHKV/kN+n8UUMlL++L432+HKS0eKKAfBTa73JcgrfHrU/c6q60xOQnRHRYU6snTPWY3h/tva92qsWREe3c/8WcD0rr54ESbHFsbkqZXFTFhs8MwSCUhLEEqQ3sAzYRsThl0PjZ2Nh0HY/J4KCKTzm4i0F7Ti74+o8aE0tJCLzKYzqCJlu3oRpVh8Uo+DsI3+lPMUbydOpuQuk4AwYXfX73IrHMcLcHUoeyxr+Klj/RyNkaRUYhWY0VQxrUMnWroN4e/Y72O3JUwO1NWHXfWGBuDfO7ab5h3/m1BlGZDegI7WC26epTZ869QcQ==

EOT

````

6. Destroy infrastructure:

`terraform destroy`