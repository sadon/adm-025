output "ssh-public-key" {
  value = tls_private_key.tf-training.public_key_openssh
}

output "vm-id" {
  value = aws_instance.web.id
}