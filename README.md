# TP-Terraform

## Requirements

No requirements.

## Providers

No provider.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| ami-ID | ID ami | `string` | n/a | yes |
| instance-type | instance\_type | `string` | n/a | yes |
| key-name | key ssh | `string` | n/a | yes |
| nb-instance-by-subnet | Nombre d'instance par subnet | `number` | `2` | no |
| owner | Name for Owner tag | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| dns | DNS instance-1 elb |

