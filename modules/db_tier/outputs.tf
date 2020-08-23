output "db_subnet_group_name" {
  description = "The Database subnet group name"
  value       = aws_db_subnet_group.aurora_db_subnet_group.name
}

output "db_subnet_ids" {
  description = "The Database subnet IDs"
  value       = [aws_subnet.db_subnet_1.id, aws_subnet.db_subnet_2.id]
}

output "db-sg-id" {
  description = "The ID of the AuroraDB Subnet"
  value = aws_security_group.auroradb_sg.id
}
