## Requirements

No requirements.

## Providers

No provider.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| ami-ID | Objet contenant les ami-id pour les instances des subnet a et b. Vous pouvez choisir des amis diferants pour les subnet | <pre>object({<br>    ami-id-subnet-a : string<br>    ami-id-subnet-b : string<br>  })</pre> | <pre>{<br>  "ami-id-subnet-a": "ami-059db4e559f0ad913",<br>  "ami-id-subnet-b": "ami-059db4e559f0ad913"<br>}</pre> | no |
| instance-type | instance\_type | `string` | `"t2.micro"` | no |
| key-name | key ssh | `string` | n/a | yes |
| nb-instance-by-subnet | Number instance by subnet | `number` | `2` | no |
| owner | Name for Owner tag | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| dns | DNS instance-1 elb |

