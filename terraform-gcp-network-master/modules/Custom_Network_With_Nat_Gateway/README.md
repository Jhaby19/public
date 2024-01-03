
## Requirements

| Name            | Version                                                              |
| ----------------- | ------------------------------------------------------------------ |
| Terraform| 0.13.6
| google | 4.14.0

## Providers

| Name            | Version                                                              |
| ----------------- | ------------------------------------------------------------------ |
| google | 4.14.0

## Configure a Service Account
### Organization level permissions
In order to create a policy, you need to grant your service account the Access Context Manager Admin role at the organization level:

#### roles/accesscontextmanager.policyAdmin


### Configure user permission

In order to view VPC Service Controls and Access Context Manger using the Google Cloud Platform Console, your user accounts will need to be granted the Resource Manager Organization Viewer:

#### roles/resourcemanager.organizationViewer
## Enable APIs

In order to operate with the Service Account you must activate the following API on the project where the Service Account was created:

#### Compute Engine API - compute.googleapis.com
## Install

Be sure you have the correct Terraform version (0.13.6 or Greater)

<!-- BEGIN_TF_DOCS -->
#### Modules

No modules.

#### Resources

| Name | Type |
|------|------|
| [google_compute_network.vpc_network](https://registry.terraform.io/providers/hashicorp/google/4.14.0/docs/resources/compute_network) | resource |
| [google_compute_router.router](https://registry.terraform.io/providers/hashicorp/google/4.14.0/docs/resources/compute_router) | resource |
| [google_compute_router_nat.nat_gateway](https://registry.terraform.io/providers/hashicorp/google/4.14.0/docs/resources/compute_router_nat) | resource |
| [google_compute_subnetwork.subnets](https://registry.terraform.io/providers/hashicorp/google/4.14.0/docs/resources/compute_subnetwork) | resource |

#### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_custom-natgatway_name"></a> [custom-natgatway_name](#input_custom-natgatway_name) | Custom Nat GateWay | `string` | n/a | yes |
| <a name="input_custom-router_name"></a> [custom-router_name](#input_custom-router_name) | The name of the router in which this NAT will be configured. | `string` | n/a | yes |
| <a name="input_env"></a> [env](#input_env) | name of the environment i.e (QA, production) it should be used in conjunction with the name of VPC to create names | `string` | n/a | yes |
| <a name="input_nat_ip_allocate"></a> [nat_ip_allocate](#input_nat_ip_allocate) | Value inferred based on nat_ips. If present set to MANUAL_ONLY, otherwise AUTO_ONLY. | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input_project) | project where this VPC will be created | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input_region) | This is The Region Name Where Vpc and Subnets Created | `string` | n/a | yes |
| <a name="input_subnets"></a> [subnets](#input_subnets) | Custom Subnet Name | `map(any)` | n/a | yes |
| <a name="input_subnetwork_ip_ranges_to_nat"></a> [subnetwork_ip_ranges_to_nat](#input_subnetwork_ip_ranges_to_nat) | Defaults to ALL_SUBNETWORKS_ALL_IP_RANGES. How NAT should be configured per Subnetwork. | `string` | n/a | yes |
| <a name="input_vpc_name"></a> [vpc_name](#input_vpc_name) | Custom Vpc Name | `string` | n/a | yes |
| <a name="input_auto_create_subnetworks"></a> [auto_create_subnetworks](#input_auto_create_subnetworks) | When set to true, the network is created in 'auto subnet mode' and it will create a subnet for each region automatically across the 10.128.0.0/9 address range. | `bool` | `null` | no |
| <a name="input_log_config"></a> [log_config](#input_log_config) | n/a | `list(map(any))` | `[]` | no |
| <a name="input_mtu"></a> [mtu](#input_mtu) | The network MTU. Must be a value between 1460 and 1500 inclusive. If set to 0 (meaning MTU is unset), the network will default to 1460 automatically. | `number` | `0` | no |
| <a name="input_router_asn"></a> [router_asn](#input_router_asn) | Router ASN, only if router is not passed in and is created by the module. | `number` | `"64514"` | no |
| <a name="input_routing_mode"></a> [routing_mode](#input_routing_mode) | The network routing mode (default 'GLOBAL') | `string` | `"GLOBAL"` | no |
| <a name="input_subnetwork"></a> [subnetwork](#input_subnetwork) | n/a | <pre>list(object({<br>    name                    = string,<br>    source_ip_ranges_to_nat = list(string)<br>  }))</pre> | `[]` | no |
| <a name="input_vpc_description"></a> [vpc_description](#input_vpc_description) | An optional description of this resource. | `string` | `""` | no |

#### Outputs

| Name | Description |
|------|-------------|
| <a name="output_network"></a> [network](#output_network) | The VPC resource being created |
| <a name="output_network_name"></a> [network_name](#output_network_name) | The name of the VPC being created |
| <a name="output_network_self_link"></a> [network_self_link](#output_network_self_link) | The URI of the VPC being created |
| <a name="output_subnets"></a> [subnets](#output_subnets) | The created subnet resources |
<!-- END_TF_DOCS -->
