1. 
Security group needs to define rules in `ingress` and `egress` blocks:

Create security group definition with open TCP ports 80 and 81:
````
...
resource "aws_security_group" "web-tf-static" {
  name = "test-static-sg-${random_string.random-suffix.result}"
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
````

2. Extent it for 443 and port 8080:
````
...
  ingress {
    from_port = 443
    protocol = "tcp"
    to_port = 443
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 8080
    protocol = "tcp"
    to_port = 8080
    cidr_blocks = ["0.0.0.0/0"]
  }...
````

3. Conclusion: It is required to define **one** object with repeatable options.

Run `terraform apply` and review security group definition in AWS Console
   

4. Group open ports in _locals_:
````
locals {
  open_ports_map = {main:"80", "testers":"8080", "alt_clients" : "81", "billing": "443"}
}
````

5. Create new security group using:
   
   **dynamic** keyword for repeatable block
   
   `content` block as basis
   
   `ingress.key`, `ingress.value` as loops interanl variables:

````
resource "aws_security_group" "web-tf-dynamic" {
  name = "test-dynamic-sg-${random_string.random-suffix.result}"
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
````

6. Compare Security Groups in AWS Console - Rules are the same.

7. Destroy infrastructure:
   `terrafrom destroy`
   
Note: 
This is a study example, actually modern HTTP Protocol (QUIC) uses both TCP and UPD transport,
so in case of real web-traffic it needs to extend rules for UDP protocol.