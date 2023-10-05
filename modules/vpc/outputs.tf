output "subnet_id" {
  value = aws_subnet.this.id
}
output "ami_id" {
  value = data.aws_ssm_parameter.this.value
}
output "vpc_id" {
  value = aws_vpc.this.id
}
output "vpc2_id" {
  value = aws_vpc.vpc.id
}
output "route_table_id" {
  value = aws_route_table.private.id
}
output "cidr_block" {
  value = aws_vpc.vpc.cidr_block
}