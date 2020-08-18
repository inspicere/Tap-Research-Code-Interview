#### Memcached subnets
resource "aws_subnet" "memcached_subnet_1" {
  vpc_id = var.vpc_id
  cidr_block = var.aws_memcached_subnet_1_cidr
  tags = {
    Name = "Memcached Subnet 1"
    Subnet = "Memcached"
  }
}

### SECURITY GROUP
resource "aws_security_group" "memcached_sg" {
  name = "memcached-sg"
  vpc_id = var.vpc_id

  # TCP access only from app subnet
  ingress {
    description = "Allow 11211 from app subnet to memcached subnet"
    from_port   = 11211
    to_port     = 11211
    protocol    = "tcp"
    cidr_blocks = [
      var.aws_app_subnet_1_cidr, # app subnet
    ]
  }

  # Egress to app subnet
  egress {
    description = "Allow egress on all ports to app subnet. This is overly permissive"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [
      var.aws_app_subnet_1_cidr, # app subnet
    ]
  }
}
