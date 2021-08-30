1. Create the file with content:
````
# ./workspaces.tf

resource "random_string" "suffix" {
  length = 10
  special = false
  upper = false
}

resource "aws_s3_bucket" "images" {
  bucket = "luxoft-adm025-wspace-${terraform.workspace}-${random_string.suffix.result}"
}
````

2. Run:
 - `terraform init`
   
3. Review current workspaces:
   
`terraform workspace list`
   
4. Create new workspace

`terraform workspace new dev`

Check workspace:
````
terraform workspace list
> default
> * dev
````

Select it, if necessary:
`terrafrom seect dev`

5. Apply changes in **dev** workspace:

`terrafrom apply`

6. Create new and select workspace: **prod**

`terraform workspace new prod`

7. Run
- `terraform plan`
 > Terraform will perform the following actions:
````
...
# aws_s3_bucket.images will be created
...
# random_string.suffix will be created
...
Plan: 2 to add, 0 to change, 0 to destroy.
````

8. Review `terraform.tfstate.d` directory:
````
tree terraform.tfstate.d/
terraform.tfstate.d/
├── dev
│ └── terraform.tfstate
└── prod

2 directories, 1 file
````

Review buckets in AWS Console

9. Clean existing resources in all workspaces
````
$ terraform workspace select dev
$ terrafrom destroy
````

10. Clean workspaces:

Note: It is impossible to delete a current workspace, 
so it needs to select another before deletion

````
$ terraform workspace select default
$ terraform workspace delete dev
$ terraform workspace delete prod
````


