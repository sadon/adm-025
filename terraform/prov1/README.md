1. Run `touch ./my-hardware.tf`
   
2. Add follow lines with your authentication data, provided before the training
````
resource "random_string" "random-suffix" {
  length = 5
  upper = false
  special = false
}

resource "aws_s3_bucket" "my-config" {
  bucket = "aws-luxoft-prov1-${random_string.random-suffix.result}-test"
}


resource "aws_s3_bucket_object" "my-config" {
  bucket = aws_s3_bucket.my-config.bucket
  key = "./my-hardware.txt"
  source = "./my-hardware.txt"
}
````
3. Add provisioners block
````
  provisioner "local-exec" {
    command = "hostinfo > ./my-hardware.txt"
    on_failure = fail
  }

  provisioner "local-exec" {
    when = destroy
    command = "rm ./my-hardware.txt"
    on_failure = continue
  }
````
Note: For windows codeuse `systeminfo` command

4.
    Run `terraform init` command
   
    Run `terraform apply` command


5. Try to test logic on_failure = fail:
   change command to `host_noinfo_`
   
   Run `terraform apply` command


6. Review /my-hardware.txt file in S3 AWS Console


7. Destroy infrastructure:

`terraform destroy`