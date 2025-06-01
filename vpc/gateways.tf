
###################
# Internet Gateway
###################
# Create Internet Gateway
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.base.id

  tags = merge(local.tags, {
    Name = "${var.network_info.vpc_name}"

  })
}
##############
# VPN Gateway
##############

##############
# NAT Gateway
##############

#############################
# Transit Gateway Attachment
#############################