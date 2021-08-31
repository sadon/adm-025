# Create AWS EC2 instance

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |
| tls | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| ami | n/a | `string` | n/a | yes |
| keypair\_name | n/a | `string` | n/a | yes |
| vm\_name | n/a | `string` | n/a | yes |
| vm\_type | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| ssh-public-key | n/a |
| vm-id | n/a |

