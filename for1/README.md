1. Create generic biography in locals, by example:

````
locals {
  books = {
    "about-me.txt" : "I was born in 19XX. I live in default City.",
    "my-family.txt" : "I have got a sister, her mane is Diana.",
    "my-friends.txt" : "My best friend - John "
  }
}
````

2. So, It's time to add this info  into a bucket:
Create HCL Code, like below:
````
...
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
...
````

3. Run `terraform apply` and review bucket content in AWS Console
   

4. Create code which will group `aws_s3_bucket_object` 
Create new bucket and put in biography files: 
   
use **each.key** as object name, **each.value** as object content

````
resource "aws_s3_bucket_object" "my-foreach-books" {
  bucket   = aws_s3_bucket.test-foreach.id
  for_each = local.books

  key          = each.key
  content      = each.value
  content_type = "plain/text"
}
````

5. Review results in AWS Console

6. Destroy infrastructure:
   `terrafrom destroy`
   