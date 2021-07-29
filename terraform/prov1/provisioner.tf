
resource "null_resource" "test" {
  # ...

  provisioner "local-exec" {
    command    = "echo 'The special resource is creating'"
    on_failure = continue
  }
  provisioner "local-exec" {
    when    = destroy
    command = "unexpected command"
    on_failure = fail
  }
}