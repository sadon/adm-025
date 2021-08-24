1. Open attached **./state.tf** file


2. Run:
 - `terraform init`
 - `terraform plan`

Review plan
   
3. Save plan to **for-developers.plan** file with command: `terraform plan -out ./for-developers.plan`

4. Use `terraform show`command for review plan's changes
````
$terraform show for-developers.plan
...
Plan: 2 to add, 0 to change, 0 to destroy.
````

5. Apply changes 
   
`terraform apply ./for-developers.plan`

_Terraform will not ask for confirmation!_

6. Review applied resources:
````
$cat my-db-config.ini 
  db_name = "terraform"
  db_pass = "default"
$cat my-web-config.ini 
  domain_name = "www.example.com"
  proxy_pass = "127.0.0.1"
````