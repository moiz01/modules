output "vpc_id" {
  value = aws_vpc.my_vpc.id
}
output "public_subnets_ids" {
  value = aws_subnet.public.*.id
}

