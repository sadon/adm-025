variable "vm_type" {
  type = string
  validation {
    condition     = length(var.vm_type) > 3
    error_message = "Instance type name must be a string more than symbols."
  }
}

variable "ami" {
  type = string
  validation {
    condition     = can(regex("^ami\\-[0-9a-f]+$", var.ami))
    error_message = "Ami ID is incorrect. Valid example: 'ami-043097594a7df80ec'."
  }
}

variable "keypair_name" {
  type = string
}

variable "vm_name" {
  type = string
}

