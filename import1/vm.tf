resource "aws_instance" "web" {
  instance_type = "t2.micro"
  ami = "ami-043097594a7df80ec"
  tags = {
    #Name: "adm-025-test-import"
  }
}
