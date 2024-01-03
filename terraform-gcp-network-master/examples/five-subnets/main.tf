module "network_name" {
  source                  = "github.com/carbonteq/terraform-gcp-network/modules/Custom_Network_With_Nat_Gateway"
  vpc_name                = "carbonteq"
  env                     = "dev"
  region                  = "asia-south1"
  vpc_description         = "Custom GCP Module Vpc In Terraform"
  routing_mode            = "REGIONAL"
  project                 = "carbonteq"
  auto_create_subnetworks = false
  mtu                     = "1460"

  subnets = {
    "subnet1" = {
      subnet_name              = "carbonteqpublic-b"
      subnet_description       = "Public Subnet, Zone asia South1-b "
      subnet_ip_range          = "10.175.0.0/19"
      private_ip_google_access = false
      subnet_region            = "asia-south1"
      subnet_project           = "carbonteq"
    },

    "subnet2" = {
      subnet_name              = "carbonteqpublic-c"
      subnet_description       = "Public Subnet, Zone asia South1-c "
      subnet_ip_range          = "10.175.32.0/19"
      private_ip_google_access = false
      subnet_region            = "asia-south1"
      subnet_project           = "carbonteq"
    },

    "subnet3" = {
      subnet_name              = "carbonteqprivate-b"
      subnet_description       = "Private Subnet, Zone asia South1-b "
      subnet_ip_range          = "10.175.64.0/19"
      private_ip_google_access = false
      subnet_region            = "asia-south1"
      subnet_project           = "carbonteq"
    },

    "subnet4" = {
      subnet_name              = "carbonteqprivate-c"
      subnet_description       = "Private Subnet, Zone asia South1-c "
      subnet_ip_range          = "10.175.96.0/19"
      private_ip_google_access = false
      subnet_region            = "asia-south1"
      subnet_project           = "carbonteq"
    },

    "subnet5" = {
      subnet_name              = "carbonteqprivate-a"
      subnet_description       = "Private Subnet, Zone asia South1-c "
      subnet_ip_range          = "10.175.44.0/19"
      private_ip_google_access = false
      subnet_region            = "asia-south1"
      subnet_project           = "carbonteq"
    }
  }

  custom-router_name          = "router"
  router_asn                  = "64514"
  custom-natgatway_name       = "gateway"
  nat_ip_allocate             = "AUTO_ONLY"
  subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
  log_config = [
    {
      enable = true
      filter = "ERRORS_ONLY"
  }]
}
# "Manually" define the subnetworks for which the NAT is used, so that we can exclude the public subnetwork
/*
subnetwork = [{
      name                       = "Manual_name"
      source_ip_ranges_to_nat    = ["ALL_IP_RANGES"]
}]

*/
