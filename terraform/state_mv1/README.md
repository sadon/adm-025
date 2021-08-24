1. Create file with empty content:
````
touch work-with-states.tf
````

2. Run:
 - `terraform init`
 - `terraform apply`
 - Review state file: `cat terraform.tfstate`

3. Change file content to:
````
# ./work-with-states.tf

resource "random_string" "test" {
  length = 10
}
````

4. Run
- `terraform apply`
- Review state file again: `cat terraform.tfstate`

5. Change file content, replace `length = 10` on `length = 15`
````
# ./work-with-states.tf

resource "random_string" "test" {
  length = 15
}
````

6. Run
- `terraform apply`
- Review state file again and compare with previous versions: `cat terraform.tfstate`
