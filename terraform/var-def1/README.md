1. Copy files from var1 exercise:
````
# ./ask-for-vars.tf
#Run before: export TF_VAR_visited_city="Saint-Petersburg"

variable "name" {}
variable "city" {}
variable "visited_city" {}

resource "local_file" "test" {
  filename = "variables-testing.txt"
  content  = <<-EOT
    Hello, my name is ${var.name}.
    I live in ${var.city}.
    I visited ${var.visited_city} last year.
  EOT
}

locals {
  prefix = "my-company"
}
````

2. Define Moscow as default city:
 ````
 variable "city" {
  default = "Moscow"
  ...
 ````
   
3. Define variables types, like here:
````
variable "city" {
default = "Moscow"
type = string
...
}
variable "mobile" {
type = number
...
}
````
   
4. Add validation and error messages for **name** and **city**:
````
  validation {
    condition = can(regex("^[A-Z]", var.name))
    error_message = "Your name starts with Capital letter."
  }
````

Add mobile number validation:
````
variable "mobile" {
  type = number
  validation {
    condition = can(len(var.mobile) < 15)
  }
}
````

Add **sensitive** flag for the mobile field:


5. Try to test validators.

with `terraform plan`command