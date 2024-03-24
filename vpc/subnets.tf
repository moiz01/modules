
################
# DMZ Subnet
################

################
# Public subnet
################
# Create Public Subnet
resource "aws_subnet" "public" {
  count                   = length(var.public_subnets)
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.public_subnets[count.index]
  map_public_ip_on_launch = true
  availability_zone       = var.azs[count.index]

  tags = merge(var.tags, {
    Name = "${var.vpc_name}-Public-${var.azs[count.index]}"

  })
  depends_on = [ aws_vpc.my_vpc ]
}
#################
# Private subnet
#################

##################
# Subnet Groups
##################