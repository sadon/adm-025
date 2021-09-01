Step 1: prepare Only SSH Key locally 
---
`terraform plan -target=tls_private_key.tf-training`

Step 2: prepare web-instance only
---
`terraform plan -target=aws_instance.web`


Step 2: prepare KeyPair only
---
`terraform plan -target=aws_key_pair.tf-training`