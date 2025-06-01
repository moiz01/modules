
# Create Security group
resource "aws_security_group" "security_group" {
  name = var.security_group_info.name
  description = var.security_group_info.description
  vpc_id = data.aws_vpc.vpc.id
 

  tags = merge(local.tags,{
    Name= "${var.security_group_info.name}"

  })
 
}

// fetch security group from rules input
resource "aws_security_group_rule" "rules" {
  count             = length(var.security_group_info.rules)  //TODO
  type              = var.security_group_info.rules[count.index].type
  from_port         = var.security_group_info.rules[count.index].from_port
  to_port           = var.security_group_info.rules[count.index].to_port
  security_group_id = aws_security_group.security_group.id //TODO
  protocol          = var.security_group_info.rules[count.index].protocol
  cidr_blocks       = var.security_group_info.rules[count.index].cidr_block
depends_on = [ aws_security_group.security_group ]
}




# locals {
#   http_port    = 80
#   any_port     = 0
#   any_protocol = "-1"
#   tcp_protocol = "tcp"
#   all_ips      = ["0.0.0.0/0"]
# }