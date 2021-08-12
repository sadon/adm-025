
resource "random_string" "suffix" {
  length = 10
  special = false
  upper = false
}


resource "aws_s3_bucket" "images" {
  bucket = "luxoft-adm025-wspace-${terraform.workspace}-${random_string.suffix.result}"
}
