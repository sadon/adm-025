Step 1: Taint usage
---
`terraform plan taint tls_private_key.tf-training`

Step 2: Replace usage
---
`terraform plan -replace="tls_private_key.tf-training"`
