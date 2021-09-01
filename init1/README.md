1. Create file with following content:
````
#./aws-providers.tf

provider "aws" {
    profile = "tf-training"
    region = "eu-central-1"
}
````
2. Run `terraform init` command

3. Review **.terraform** directory content, like here:
````
tree ./.terraform
   ./.terraform
   └── providers
   └── registry.terraform.io
   └── hashicorp
   └── aws
   └── 3.54.0
   └── darwin_amd64
   └── terraform-provider-aws_v3.54.0_x5

6 directories, 1 file
````

4. Remove provider definition from the **./aws-providers.tf** file:
    `echo '' > ./aws-provider.tf`
   
and clear **.terraform** folder
   `rm -rf ./.terraform`

5. Run `terraform init` command again, you will see:
````
 tree ./.terraform
./.terraform [error opening dir]

0 directories, 0 files
````