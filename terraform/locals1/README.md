1. Prepare simple ec2 config in **vm-plus-ssh.tf** file
````
resource "aws_instance" "web" {
  instance_type = "t2.nano"
  ami           = "ami-043097594a7df80ec"
  key_name      = aws_key_pair.tf-training.key_name
}

resource "tls_private_key" "tf-training" {
  algorithm = "RSA"
  rsa_bits  = 4096

}

resource "aws_key_pair" "tf-training" {
  key_name   = "tf-training-key"
  public_key = tls_private_key.tf-training.public_key_openssh
}

````

2. Run plan and check syntax:
   
Run `terraform init` command

Run `terraform plan` command
 
3. Add `locals` block with default key values:
````
  default_tags = {
    "owner" : "Luxoft"
    "seminar-id" : "adm-025"
  }
````

4. Review objects which support tagging:
It is:
   ````
   resource "aws_instance" "web"
   resource "aws_key_pair" "tf-training"
   ````

5. Add tags to the base elements: 
So it will looks like:
````
...
tags = {
   Name : "Firstname Lastname ec2 key"
}
````

6. How to combine existing tags and locals'?
Use `merge`
So, the final resources definintion will be:
   
````
resource "aws_instance" "web" {
  instance_type = "t2.nano"
  ami           = "ami-043097594a7df80ec"
  key_name      = aws_key_pair.tf-training.key_name
  tags = merge(
    local.default_tags,
    {
      Name : "EC2 of Firstname Lastname"
    }
  )
}
...
resource "aws_key_pair" "tf-training" {
  key_name   = "tf-training-key"
  public_key = tls_private_key.tf-training.public_key_openssh
  tags = merge(
    local.default_tags,
    {
      Name : "Firstname Lastname ec2 key"
    }
  )
}
````

7. Apply the config and review result in AWS Console:

Run `terraform init` command
Run `terraform apply` command
Open AWS EC2 Console and review tags for objects

8. Destroy infrastructure:

Run `terraform destroy`