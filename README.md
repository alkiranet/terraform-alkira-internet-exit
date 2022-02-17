# Internet Exit Connector - Terraform Module
This module makes it easy to provision an [Internet Exit](https://registry.terraform.io/providers/alkiranet/alkira/latest/docs/resources/connector_internet_exit) in [Alkira](htts://alkira.com).

## What it does
- Provision an [Internet Connector](https://registry.terraform.io/providers/alkiranet/alkira/latest/docs/resources/connector_internet_exit)
- Apply [Billing Tags](https://registry.terraform.io/providers/alkiranet/alkira/latest/docs/data-sources/billing_tag) to the connector
- Place connector in an existing [segment](https://registry.terraform.io/providers/alkiranet/alkira/latest/docs/data-sources/segment) and [group](https://registry.terraform.io/providers/alkiranet/alkira/latest/docs/data-sources/group)
- Provide additional options for customization

## Example Usage
This connector allows traffic from various clouds, sites, and users to _egress_ to the internet. The number of public IP addresses can be adjusted to accommodate heavier traffic flows. In addition, adding the **traffic_dist_attribute = "SRC_IP"** allows for traffic exiting the _CXP_ to be based on source IP address only.

```hcl
module "inet_exit" {
  source = "alkiranet/internet-exit/alkira"

  name         = "inet-east"
  cxp          = "US-EAST-2"
  segment      = "corporate"
  group        = "non-prod"
  billing_tags = ["network", "security"]

  # Advanced (optional)
  public_ip_number       = 6
  traffic_dist_algorithm = "HASHING"
  traffic_dist_attribute = "SRC_IP"

}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.1 |
| <a name="requirement_alkira"></a> [alkira](#requirement\_alkira) | >= 0.8.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_alkira"></a> [alkira](#provider\_alkira) | >= 0.8.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [alkira_connector_internet_exit.connector](https://registry.terraform.io/providers/alkiranet/alkira/latest/docs/resources/connector_internet_exit) | resource |
| [alkira_billing_tag.tag](https://registry.terraform.io/providers/alkiranet/alkira/latest/docs/data-sources/billing_tag) | data source |
| [alkira_group.group](https://registry.terraform.io/providers/alkiranet/alkira/latest/docs/data-sources/group) | data source |
| [alkira_segment.segment](https://registry.terraform.io/providers/alkiranet/alkira/latest/docs/data-sources/segment) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_billing_tags"></a> [billing\_tags](#input\_billing\_tags) | List of billing tag names to apply to connector | `list(string)` | `[]` | no |
| <a name="input_cxp"></a> [cxp](#input\_cxp) | Alkira - CXP to add connector to | `string` | n/a | yes |
| <a name="input_description"></a> [description](#input\_description) | Description of the connector | `string` | `""` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Status of connector; Default is true | `bool` | `true` | no |
| <a name="input_group"></a> [group](#input\_group) | Alkira - group to add connector to | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Name of cloud network and Alkira connector | `string` | n/a | yes |
| <a name="input_public_ip_number"></a> [public\_ip\_number](#input\_public\_ip\_number) | Number of public IPs for connector; Default is 2 | `number` | `2` | no |
| <a name="input_segment"></a> [segment](#input\_segment) | Alkira - segment to add connector to | `string` | n/a | yes |
| <a name="input_size"></a> [size](#input\_size) | Alkira - connector size | `string` | `"SMALL"` | no |
| <a name="input_traffic_dist_algorithm"></a> [traffic\_dist\_algorithm](#input\_traffic\_dist\_algorithm) | Algorithm used for traffic distribution | `string` | `"HASHING"` | no |
| <a name="input_traffic_dist_attribute"></a> [traffic\_dist\_attribute](#input\_traffic\_dist\_attribute) | Attribute of algorithm used for traffic distribution | `string` | `"DEFAULT"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_connector_id"></a> [connector\_id](#output\_connector\_id) | ID of the connector |
| <a name="output_cxp"></a> [cxp](#output\_cxp) | CXP that connector was provisioned in |
| <a name="output_group"></a> [group](#output\_group) | Group that connector was added to |
| <a name="output_name"></a> [name](#output\_name) | Connector name |
| <a name="output_segment_id"></a> [segment\_id](#output\_segment\_id) | Segment that connector was placed in |
| <a name="output_size"></a> [size](#output\_size) | Size of the connector |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
