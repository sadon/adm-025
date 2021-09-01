# Do not use this example in production
# Use special security tools like Vault or similar

resource "local_file" "my-db-config" {
  filename = "./my-db-config.ini"
  content = <<EOT
  db_name = "terraform"
  db_pass = "default"
EOT
}

resource "local_file" "my-web-server-config" {
  filename = "./my-web-config.ini"
  content = <<EOT
  domain_name = "www.example.com"
  proxy_pass = "127.0.0.1"
EOT
}
