output "nat_gateway_id" {
  description = "The ID of the VPC"
  value       = aws_nat_gateway.nat-gw.id
}

output "bastion_subnet_id" {
  description = "The ID of the VPC"
  value       = aws_subnet.bastion.id
}

output "alb_subnet_id" {
  description = "The ID of the VPC"
  value       = aws_subnet.alb.id
}