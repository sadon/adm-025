
resource "null_resource" "test" {
  # ...

  provisioner "local-exec" {
    command    = "echo 'You have to log new data'"
    on_failure = continue
  }
  provisioner "local-exec" {
    when    = destroy
    command = "echo 'Destroy sub-resource infrastructure'"
    on_failure = fail
  }
}