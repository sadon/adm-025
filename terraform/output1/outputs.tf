
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