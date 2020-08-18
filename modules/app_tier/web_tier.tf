#provision application subnet
resource "aws_subnet" "app_subnet" {
  vpc_id = var.vpc_id
  cidr_block = var.aws_app_subnet_1_cidr
  tags = {
    Name = "Application subnet"
    Subnet = "App"
  }
}

# App subnet routes for NAT
resource "aws_route_table" "app-subnet-routes" {
    vpc_id = var.vpc_id
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = var.nat_gateway_id
    }

    tags = {
        Name = "web-subnet-routes-1"
    }
}
resource "aws_route_table_association" "app-subnet-routes" {
    subnet_id = aws_subnet.app_subnet.id
    route_table_id = aws_route_table.app-subnet-routes.id
}

### SECURITY GROUPS #########################

#Private access for app subnet
resource "aws_security_group" "app" {
  name = "app-sg"
  vpc_id = var.vpc_id

  # ssh access from bastion
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = [var.aws_pub_subnet_1_cidr]
  }

  # http access from load balancer
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "TCP"
    cidr_blocks = [var.aws_pub_subnet_2_cidr]
  }
  # Allow out to any to be narrowed
  egress {
    protocol = "-1"
    from_port = 0
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}
