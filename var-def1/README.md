1. Define local-file as resource:
````
# ./ask-for-vars.tf
resource "local_file" "test" {
  filename = "variables-testing.txt"
  content  = <<-EOT
    Hello, my name is ${var.name}.
    I live in ${var.city}.
    I visited ${var.visited_city} last year.
    Please call ${var.mobile}
  EOT
}
````

2. The text above has no _var.city_ definition,
so, create a config file with name **my-city.auto.tfvars**
````
# my-city.auto.tfvars
city = "Moscow"
````

Actually Terraform will use mask *.auto.tfvars files for searching vars

3. Define environment variables types, like here:
````
export TF_VAR_visited_city="Saint-Petersburg"
````


Notice: To setup environment variables from sh files (into external shell) 

use `source <path-to-file>` construction

4. Run 'terraform plan`
Terraform will ask for var.name:
````
terraform plan
var.name
    Your name

    Enter a value:
````

5. Rerun with var definition in command line
`terraform plan -var name=YourName` 
   
6. Apply config and review result file: ex.:
````
$cat ./variables-testing.txt

Hello, my name is Dmitry.
I live in Moscow.
I visited Saint-Petersburg last year.
````