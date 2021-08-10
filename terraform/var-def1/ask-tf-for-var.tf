#Run before: export TF_VAR_visited_city="Saint-Petersburg"

variable "name" {
  description = "Your name"
  validation {
    condition = can(regex("^[A-Z]", var.name))
    error_message = "Your name starts with Capital letter."
  }
}
variable "city" {
  default = "Moscow"
  type = string
  validation {
    condition = can(regex("^[A-Z]", var.name))
    error_message = "Your name starts with Capital letter."
  }

}

variable "mobile" {
  type = number
  #sensitive= true
  validation {
    condition = can(len(var.mobile) < 15)
  }
}

variable "visited_city" {}

resource "local_file" "test" {
  filename = "variables-testing.txt"
  content  = <<-EOT
    Hello, my name is ${var.name}.
    I live in ${var.city}.
    I visited ${var.visited_city} last year.
    Please call ${var.mobile}
  EOT
}