locals {
  books = {
    "about-me.txt" : "I was born in 19XX. I live in default City.",
    "my-family.txt" : "I have got a sister, her mane is Diana.",
    "my-friends.txt" : "My best friend - John "
  }
}

resource "random_string" "suffix" {
  length = 10
  special = false
  upper = false
}

resource "aws_s3_bucket" "test" {
  bucket = "luxoft-adm025-foreach-${random_string.suffix.result}"
}

resource "aws_s3_bucket_object" "my-books" {
  bucket   = aws_s3_bucket.test.id
  for_each = local.books

  key          = each.key
  content      = each.value
  content_type = "plain/text"
}