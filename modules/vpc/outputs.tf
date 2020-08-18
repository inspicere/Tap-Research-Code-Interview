output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.app_vpc.id
}

output "igw_id" {
  description = "The ID of the VPC"
  value       = aws_internet_gateway.app_igw.id
}
