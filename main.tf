# Create a GCP VPC

resource "aviatrix_vpc" "gcp-transit-vpc" {
  cloud_type   = 4
  account_name = "shahzad-single-cloud-project"
  name         = "gcp-transit-vpc-uswest1"

  subnets {
    name   = "uswest1-transit-subnet-1"
    region = "us-west1"
    cidr   = "10.10.11.0/24"
  }

  subnets {
    name   = "uswest1-transit-subnet-2"
    region = "us-west1"
    cidr   = "10.10.12.0/24"
  }
}



resource "aviatrix_vpc" "gcp-spoke-vpc1" {
  cloud_type   = 4
  account_name = "shahzad-single-cloud-project"
  name         = "gcp-spoke-vpc1-uswest1"

  subnets {
    name   = "uswest1-spoke1-subnet-1"
    region = "us-west1"
    cidr   = "10.11.11.0/24"
  }

  subnets {
    name   = "uswest1-spoke2-subnet-2"
    region = "us-west1"
    cidr   = "10.11.12.0/24"
  }
}



# Create an Aviatrix Standalone GCP Gateway
resource "aviatrix_gateway" "standalone-gw1" {
  cloud_type   = 4
  account_name = "shahzad-single-cloud-project"
  gw_name      = "standalone-gw1"
  vpc_id       = aviatrix_vpc.gcp-spoke-vpc1.vpc_id
  subnet       = aviatrix_vpc.gcp-spoke-vpc1.subnets[0].cidr
  vpc_reg      = aviatrix_vpc.gcp-spoke-vpc1.subnets[0].region
  gw_size      = "n1-standard-1"
}