Notices:
## Extract ssh-key 

`terraform show -json | jq -r '.values.root_module.resources | map(select (.type | contains("tls_private_key"))) | .[].values.private_key_pem'  > ~/.ssh/tf-key-3-tier`

`chmod 0400 ~/.ssh/tf-key-3-tier`



