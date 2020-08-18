output "redis_subnet_id" {
  description = "The ID of the VPC"
  value       = aws_subnet.redis_subnet_1.id
}

output "redis-sg-id" {
  description = "The ID of the Redis Subnet"
  value = aws_security_group.redis.id
}