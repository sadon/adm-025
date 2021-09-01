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
$ tree -a ./.terraform
tree -a ./
./
├── .terraform
│ └── providers
│     └── registry.terraform.io
│         └── hashicorp
│             └── aws
│                 └── 3.56.0
│                     └── darwin_amd64
│                         └── terraform-provider-aws_v3.56.0_x5
├── .terraform.lock.hcl
├── README.md
└── aws-provider.tf

6 directories, 1 file
````

4. Remove provider definition from the **./aws-providers.tf** file:
    `echo '' > ./aws-provider.tf`
   
5. and clear **.terraform** folder
   `rm -rf ./.terraform`

6. Run `terraform init` command again, you will see:
````
tree -a ./
./
├── .terraform.lock.hcl
├── README.md
└── aws-provider.tf

0 directories, 3 files
````