1. Create the file with content:
````
# ./state_mv1.tf
resource "random_string" "tables-prefix" {
  length = 10
}
````

2. Run:
 - `terraform init`
 - `terraform apply`
 - Review: `terraform state list`:
   >random_string.tables-prefix

3. Change file content to:
````
# ./state_mv1.tf
resource "random_string" "env-prefix" {
  length = 10
}

````

4. Run
- `terraform plan`
 > Terraform will perform the following actions:
````
# random_string.env-prefix will be destroyed
- resource "random_string" "env-prefix" {
    - id          = "<yif-A>-*z" -> null
    - length      = 10 -> null
    - lower       = true -> null
    - min_lower   = 0 -> null
    - min_numeric = 0 -> null
    - min_special = 0 -> null
    - min_upper   = 0 -> null
    - number      = true -> null
    - result      = "<yif-A>-*z" -> null
    - special     = true -> null
    - upper       = true -> null
      }

# random_string.tables-prefix will be created
+ resource "random_string" "tables-prefix" {
    + id          = (known after apply)
    + length      = 10
    + lower       = true
    + min_lower   = 0
    + min_numeric = 0
    + min_special = 0
    + min_upper   = 0
    + number      = true
    + result      = (known after apply)
    + special     = true
    + upper       = true
      }

Plan: 1 to add, 0 to change, 1 to destroy.
````

5. Run 

````
terraform state mv random_string.tables-prefix random_string.env-prefix
Move "random_string.tables-prefix" to "random_string.env-prefix"

Successfully moved 1 object(s).
````

6. Run `terrafrom plan` again, It should be:

````
terraform plan
random_string.env-prefix: Refreshing state... [id=NeW_$]DSpU]

No changes. Your infrastructure matches the configuration.````
````

