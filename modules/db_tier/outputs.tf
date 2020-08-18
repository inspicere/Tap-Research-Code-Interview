output "db_subnet_id" {
  description = "The ID of the VPC"
  value       = aws_subnet.aurora_db_subnet_1.id
}

output "db-sg-id" {
  description = "The ID of the AuroraDB Subnet"
  value = aws_security_group.auroradb_sg.id
}