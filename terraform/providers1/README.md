1. Run `touch ./aws-providers.tf`
2. Add follow lines with your authentication data, provided before the training
````
# ./aws-providers.tf
provider "aws" {
  region = "eu-central-1"
  access_key = "..."
  secret_key = "..."

}
````
3. Modify your aws credentials file, and add new profile named **tf-training** 
````
# ~/.aws/credentials file
[tf-training]
region=eu-central-1
aws_access_key_id = YOUR_ACCESS_KEY
aws_secret_access_key = YOUR_SECRET_KEY

````
4. Add another new provider into `./aws-providers.tf` file with keyword `alias = "frankfurt-node"`
````
# ./aws-providers.tf
...
provider "aws" {
  region = "eu-central-1"
  profile = "tf-training"
  alias = "frankfurt-node"
}
````

5. Add a simple resource which will use the second provider:
````
# ./aws-providers.tf
...
resource "null_resource" "second-provider-usage-example" {
  provider = "aws.frankfurt-node"
}
````
