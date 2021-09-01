1. Open AWS Console and create instance with
   Ami-id **ami-043097594a7df80ec**
   Check region: this ami available in _eu-central-1_
  
Add Name for EC2 Instance, like:
 _adm-025-test-import-lastname_

2. Create a simple skeleton 
````
resource "aws_instance" "web" {
  instance_type = "t2.nano"
  ami = "ami-043097594a7df80ec"
}
````
3. Run `terraform init` command

Run `terraform plan` command
 
Expected 
`Plan: 1 to add, 0 to change, 0 to destroy.`

But the VM already exists!

4. Try to import VM
Review resource definition. [Import instructions](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance#import)
   So, import use VM id
   
Run import, replace with personal ids.

Output example
````
$terraform import aws_instance.web i-0b4eaeb62f906b59d
aws_instance.web: Importing from ID "i-0b4eaeb62f906b59d"...
aws_instance.web: Import prepared!
  Prepared aws_instance for import
aws_instance.web: Refreshing state... [id=i-0b4eaeb62f906b59d]

Import successful!
...
````

5. Review `terrafrom plan again`

Expected:
````
  # aws_instance.web will be updated in-place
  ~ resource "aws_instance" "web" {
        id                                   = "i-0b4eaeb62f906b59d"
      ~ tags                                 = {
          - "Name" = "adm-025-test-import" -> null
        }
      ~ tags_all                             = {
          - "Name" = "adm-025-test-import"
        } -> (known after apply)
        # (28 unchanged attributes hidden)

````


6. Add Name in the resource definition:
````
tags = {
   #Name: "adm-025-test-import"
}
````
and rerun 
`terrafrom plan`
Expected:
> No changes. Your infrastructure matches the configuration.

So, now it is Terraform managed VM!

6. Destroy infrastructure:

Run `terraform destroy`