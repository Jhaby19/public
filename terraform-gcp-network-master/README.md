
# Terraform Google VPC_Network Module
![Maintained by ](https://img.shields.io/badge/maintained%20by-carbonteq.com-blue)
![Terraform Version](https://img.shields.io/badge/tf-%3E%3D0.13.6-blue.svg)

This module makes it easy to set up a new VPC Network in GCP by defining your network and subnet ranges in a concise syntax.


It supports creating:

- A Google Virtual Private Network (VPC)
- Subnets within the VPC
- Router & Nat Gateway



Then perform the following commands on the root folder:

`terraform init` to init the plugins.

`terraform plan` to see the infrastructure plan.

`terraform apply` to apply the infrastructure build.

`terraform destroy` to destroy the built infrastructure.

## Cloud NAT GateWay

private network should not have any public IP and should goto internet with the Cloud-Nat.

Cloud NAT is a distributed, software-defined managed service. It's not based on proxy VMs or appliances. Cloud NAT configures the Andromeda software that powers your Virtual Private Cloud (VPC) network so that it provides source network address translation (source NAT or SNAT) for VMs without external IP addresses. Cloud NAT also provides destination network address translation (destination NAT or DNAT) for established inbound response packets.




![App Screenshot](https://camo.qiitausercontent.com/e867d1d728103633238b6481a0516f8461c7b32e/68747470733a2f2f71696974612d696d6167652d73746f72652e73332e616d617a6f6e6177732e636f6d2f302f3130343438392f38616462326263622d363535342d356438372d643233352d6630386262393630353035662e706e67)
