resource "random_string" "random-suffix" {
  length = 10
  upper = false
  special = false
}
resource "aws_s3_bucket" "life" {
  bucket = "my-random-bucket-adm-025-${random_string.random-suffix.result}"
  lifecycle {
    #prevent_destroy = true
  }
}
