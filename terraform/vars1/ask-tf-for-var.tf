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



