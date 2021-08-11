resource "aws_s3_bucket" "life" {
  bucket = "my-random-backet-dgdfhter23"
  lifecycle {
    prevent_destroy = true
  }
}

provider "aws" {
  profile = "tf-training"
  region  = "eu-central-1"
}