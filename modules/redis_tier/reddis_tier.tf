#### Redis subnets
resource "aws_subnet" "redis_subnet_1" {
  vpc_id = var.vpc_id
  cidr_block = var.aws_redis_subnet_1_cidr
  tags = {
    Name = "Redis Subnet 1"
    Subnet = "Redis"
  }
}

### SECURITY GROUP
resource "aws_security_group" "redis" {
  name = "redis-sg"
  vpc_id = var.vpc_id

  # TCP access only from app subnet
  ingress {
    description = "Allow 6379 from app subnet to redis subnet"
    from_port   = 6379
    to_port     = 6379
    protocol    = "tcp"
    cidr_blocks = [
      var.aws_app_subnet_1_cidr # app subnet
    ]
  }

  # Egress to app subnet
  egress {
    description = "Allow all from Redis subnet to app subnet... this is overly permissive"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [
      var.aws_app_subnet_1_cidr # app subnet
    ]
  }
}
