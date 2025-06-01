
######
# VPC
######
# Create VPC
resource "aws_vpc" "base" {
  cidr_block           = var.network_info.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "${var.network_info.vpc_name}"
  }

}








