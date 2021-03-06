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
  bucket = "luxoft-adm025-without-foreach-${random_string.suffix.result}"
}

resource "aws_s3_bucket_object" "about-me" {
  bucket   = aws_s3_bucket.test.id
  key          = "about-me.txt"
  content      = local.books["about-me.txt"]
  content_type = "plain/text"
}

resource "aws_s3_bucket_object" "my-family" {
  bucket   = aws_s3_bucket.test.id
  key          = "my-family.txt"
  content      = local.books["my-family.txt"]
  content_type = "plain/text"
}

resource "aws_s3_bucket_object" "my-friends" {
  bucket   = aws_s3_bucket.test.id
  key          = "my-friends.txt"
  content      = local.books["my-friends.txt"]
  content_type = "plain/text"
}

# With for_each keyword

resource "aws_s3_bucket" "test-foreach" {
  bucket = "luxoft-adm025-foreach-${random_string.suffix.result}"
}

resource "aws_s3_bucket_object" "my-foreach-books" {
  bucket   = aws_s3_bucket.test-foreach.id
  for_each = local.books

  key          = each.key
  content      = each.value
  content_type = "plain/text"
}