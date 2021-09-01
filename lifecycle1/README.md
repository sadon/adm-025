1. Prepare simple config in **bucket.tf** file
````
resource "random_string" "random-suffix" {
  length = 10
  upper = false
  special = false
}
resource "aws_s3_bucket" "life" {
  bucket = "my-random-bucket-adm-025-${random_string.random-suffix.result}"
}
````

2. Apply existing config
   
Run `terraform init` command

Run `terraform apply` command

Review the bucket in AWS Console

Remove the bucket `terraform destroy`
   
3. Add lifecycle block for bucket object
````
lifecycle {
    prevent_destroy = true
}
````
4. Create bucket and try to destroy

Run `terraform apply` command

Run `terraform destroy` command

Expected:
````
│ Error: Instance cannot be destroyed
│
│   on bucket.tf line 6:
│    6: resource "aws_s3_bucket" "life" {
│
│ Resource aws_s3_bucket.life has lifecycle.prevent_destroy set, but the plan calls for this resource to be
│ destroyed. To avoid this error and continue with the plan, either disable lifecycle.prevent_destroy or reduce
│ the scope of the plan using the -target flag.
````

5. Destroy infrastructure:

comment lifecycle block:
`#prevent_destroy = true`
   and run `terraform destroy`