resource "random_string" "random-suffix" {
  length = 5
  upper = false
  special = false
}

resource "aws_s3_bucket" "my-config" {
  bucket = "luxoft-adm025-prov1-${random_string.random-suffix.result}-test"
}

# Avoid custom touch file: require for "aws_s3_bucket_object.my-config['source'] attribute
resource "null_resource" "file_info" {
  provisioner "local-exec" {
    command = "touch ./my-hardware.txt"
    on_failure = fail
  }
}

resource "aws_s3_bucket_object" "my-config" {
  bucket = aws_s3_bucket.my-config.bucket
  key = "./my-hardware.txt"
  source = "./my-hardware.txt"

  provisioner "local-exec" {
    command = "hostinfo > ./my-hardware.txt"
    on_failure = fail
  }

  provisioner "local-exec" {
    when = destroy
    command = "rm ./my-hardware.txt"
    on_failure = continue
  }
}