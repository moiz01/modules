



data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Name"
    values = ["${var.vpc_name}"]
  }
}
data "aws_subnet" "subnet" {
  filter {
    name   = "tag:Name"
    values = ["${var.vm_info.subnet_name}"]
  }
}
data "aws_security_group" "sg" {
  filter {
    name   = "tag:Name"
    values = ["${var.vm_info.security_group_name}"]
  }
}
