# Create a GCP VPC

resource "aviatrix_vpc" "gcp_vpc" {
  cloud_type   = 4
  account_name = "shahzad-single-cloud-project"
  name         = "gcp-uswest1-vpc"

  subnets {
    name   = "uswest1-subnet-1"
    region = "us-west1"
    cidr   = "10.10.11.0/24"
  }

  subnets {
    name   = "uswest1-subnet-2"
    region = "us-west1"
    cidr   = "10.10.12.0/24"
  }
}