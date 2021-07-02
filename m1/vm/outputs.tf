output "ssh-key" {
  value = tls_private_key.tf-training.public_key_openssh
}