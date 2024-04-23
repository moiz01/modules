terraform {
  required_version = ">= 1.0.0, < 2.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Create Security group
resource "aws_security_group" "security_group" {
  description = var.security_group_info.description
  name = var.security_group_info.name
  # vpc_id = var.security_group_info.vpc_id                 //TODO
  vpc_id = data.aws_vpc.vpc.id
 

  tags = merge(var.tags,{
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

# data "aws_vpc" "vpc" {
#   filter {
#     name = "tag:Name"
#     values = ["${var.vpc_name}"]
#   }
# }


# locals {
#   http_port    = 80
#   any_port     = 0
#   any_protocol = "-1"
#   tcp_protocol = "tcp"
#   all_ips      = ["0.0.0.0/0"]
# }