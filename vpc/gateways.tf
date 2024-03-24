
###################
# Internet Gateway
###################
# Create Internet Gateway
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.my_vpc.id

  tags = merge(var.tags, {
    Name = "${var.vpc_name}"

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