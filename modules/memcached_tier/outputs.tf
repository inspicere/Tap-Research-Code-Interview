output "memcached_subnet_id" {
  description = "The ID of the VPC"
  value       = aws_subnet.memcached_subnet_1.id
}

output "memcached-sg-id" {
  description = "The ID of the Redis Subnet"
  value = aws_security_group.memcached_sg.id
}