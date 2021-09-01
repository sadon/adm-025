resource "aws_security_group" "web-tf-static" {
  name = "test-static-sg"
  tags = {Name:"test-static-sg"}
  description = "test-static-sg"

  ingress {
    from_port = 80
    protocol = "tcp"
    to_port = 80
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 81
    protocol = "tcp"
    to_port = 81
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 8080
    protocol = "tcp"
    to_port = 8080
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 443
    protocol = "tcp"
    to_port = 443
    cidr_blocks = ["0.0.0.0/0"]

  }
}


locals {
  open_ports_map = {main:"80", "testers":"8080", "alt_clients" : "81", "billing": "443"}
}
resource "aws_security_group" "web-tf-dynamic" {
  name = "test-dynamic-sg"
  tags = {
    Name:"test-dynamic-sg"
  }
  description = "test-dynamic-sg"

  dynamic "ingress" {
    for_each = local.open_ports_map
    content {
      description = ingress.key
      from_port = ingress.value
      to_port = ingress.value
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}
