

///////////////////   Create Custom VPC   ///////////////////////////

resource "google_compute_network" "vpc_network" {
  name                    = "${var.env}-${var.vpc_name}"
  description             = var.vpc_description
  project                 = var.project
  routing_mode            = var.routing_mode
  auto_create_subnetworks = var.auto_create_subnetworks
  mtu                     = var.mtu
}



///////////////////   Create & Configuration Custom Subnets    ///////////////////////////
resource "google_compute_subnetwork" "subnets" {
  for_each                 = var.subnets
  name                     = each.value.subnet_name
  description              = lookup(each.value, "subnet_description", "")
  project                  = each.value.subnet_project
  ip_cidr_range            = each.value.subnet_ip_range
  private_ip_google_access = lookup(each.value, "subnet_private_ip_google_access", "false")
  region                   = each.value.subnet_region
  network                  = google_compute_network.vpc_network.name
}



// private network should not have any public IP and should goto internet with the Cloud-Nat
///////////////////  Configuration Router  ///////////////////

resource "google_compute_router" "router" {
  name    = "${var.env}-${var.vpc_name}-${var.custom-router_name}"
  region  = var.region
  network = google_compute_network.vpc_network.id

  bgp {
    asn = var.router_asn
  }
}



/////////////////// Configuration Nat-Gateway  ///////////////////
resource "google_compute_router_nat" "nat_gateway" {
  name                               = "${var.env}-${var.vpc_name}-${var.custom-natgatway_name}"
  router                             = google_compute_router.router.name
  region                             = google_compute_router.router.region
  nat_ip_allocate_option             = var.nat_ip_allocate
  source_subnetwork_ip_ranges_to_nat = var.subnetwork_ip_ranges_to_nat

  dynamic "log_config" {
    for_each = var.log_config
    content {
      enable = log_config.value.enable
      filter = log_config.value.filter
    }
  }

  # "Manually" define the subnetworks for which the NAT is used, so that we can exclude the public subnetwork

  dynamic "subnetwork" {
    for_each = var.subnetwork
    content {
      name                    = subnetwork.value.name
      source_ip_ranges_to_nat = subnetwork.value.source_ip_ranges_to_nat
    }
  }
}
