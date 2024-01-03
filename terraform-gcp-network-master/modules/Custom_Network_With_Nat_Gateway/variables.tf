
variable "vpc_name" {
  description = "Custom Vpc Name "
  type        = string
}

variable "vpc_description" {
  description = "An optional description of this resource."
  type        = string
  default     = ""
}

variable "routing_mode" {
  description = "The network routing mode (default 'GLOBAL')"
  type        = string
  default     = "GLOBAL"
}

variable "project" {
  description = "project where this VPC will be created "
  type        = string
}

variable "region" {
  description = "This is The Region Name Where Vpc and Subnets Created "
  type        = string

}

variable "env" {
  description = "name of the environment i.e (QA, production) it should be used in conjunction with the name of VPC to create names"
  type        = string

}

variable "auto_create_subnetworks" {
  type        = bool
  description = "When set to true, the network is created in 'auto subnet mode' and it will create a subnet for each region automatically across the 10.128.0.0/9 address range."
  default     = null
}

variable "mtu" {
  type        = number
  description = "The network MTU. Must be a value between 1460 and 1500 inclusive. If set to 0 (meaning MTU is unset), the network will default to 1460 automatically."
  default     = 0
}


variable "subnets" {
  description = "Custom Subnet Name "
  type        = map(any)
}


variable "custom-router_name" {
  description = "The name of the router in which this NAT will be configured."
  type        = string
}

variable "router_asn" {
  description = "Router ASN, only if router is not passed in and is created by the module."
  type        = number
  default     = "64514"
}


variable "custom-natgatway_name" {
  description = "Custom Nat GateWay"
  type        = string
}

variable "nat_ip_allocate" {
  description = "Value inferred based on nat_ips. If present set to MANUAL_ONLY, otherwise AUTO_ONLY."
  type        = string
}

variable "subnetwork_ip_ranges_to_nat" {
  description = "Defaults to ALL_SUBNETWORKS_ALL_IP_RANGES. How NAT should be configured per Subnetwork."
  type        = string
}


variable "log_config" {
  type    = list(map(any))
  default = []
}


variable "subnetwork" {
  type = list(object({
    name                    = string,
    source_ip_ranges_to_nat = list(string)
  }))
  default = []
}
