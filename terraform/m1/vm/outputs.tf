output "ssh-key" {
  #value = tls_private_key.tf-training.public_key_openssh
  value = tls_private_key.tf-training.private_key_pem
  sensitive = true
}

output "vm-id" {
  value = aws_instance.web.id
}