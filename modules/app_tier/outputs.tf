output "app_subnet_id" {
  description = "The ID of the VPC"
  value       = aws_subnet.app_subnet.id
}