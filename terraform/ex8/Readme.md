## Ex.8 p2: Create and connect to baked VM:

1) `terraform apply `
Show manually `terraform show`
  

2) terraform show -json | jq -r '.values.root_module.resources | map(select (.type | contains("tls_private_key"))) | .[].values.private_key_pem'  > ~/.ssh/tf-key
   `chmod 0600 ~/.ssh/tf-key`


3) Review external ip-address:
- Review in state 
- `terraform show -json | jq -r '.values.root_module.resources | map(select (.type | contains("aws_instance"))) | .[].values.public_ip'   `

ex: "18.198.50.221"


4) Connect to VM
   `ssh -i ~/.ssh/tf-key ec2-user@54.93.229.190`
   

5) Destroy VM


### (!) Pay attention
- Use before: `mkdir -p ~/.ssh`
- Use `-r` flag for jq to replace **\n** to  **RAW** newlines
- Setup correct persmisisons for keys `chmod 0600 ~/.ssh/tf-key`