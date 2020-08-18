#provision public subnet 1 (bastion host)
resource "aws_subnet" "bastion"{

  vpc_id = var.vpc_id
  cidr_block = var.aws_pub_subnet_1_cidr
  tags = {
      Name = "Public Subnet Bastion"
      Subnet = "Bastion"
  }
#  availability_zone = data.aws_availability_zones.available.names[0]
}

#provision public subnet 2 (Load Balancer)
resource "aws_subnet" "alb"{

  vpc_id = var.vpc_id
  cidr_block = var.aws_pub_subnet_2_cidr
  tags = {
      Name = "Public Subnet LB"
      Subnet = "ALB"
  }
  #  availability_zone = data.aws_availability_zones.available.names[1]
}

resource "aws_route_table" "public-routes" {
    vpc_id = var.vpc_id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = var.igw_id
    }
}
resource "aws_route_table_association" "public-subnet-routes-1" {
    subnet_id = aws_subnet.bastion.id
    route_table_id = aws_route_table.public-routes.id
}

resource "aws_route_table_association" "public-subnet-routes-2" {
    subnet_id = aws_subnet.alb.id
    route_table_id = aws_route_table.public-routes.id
}

#NAT Gateway configuration for private subnets

resource "aws_eip" "nat-eip" {
  vpc      = true
  depends_on = [var.igw_id]
}

resource "aws_nat_gateway" "nat-gw" {
  allocation_id = aws_eip.nat-eip.id
  subnet_id = aws_subnet.bastion.id
  depends_on = [var.igw_id]
}

#bastion sg
resource "aws_security_group" "bastion" {
  name = "bastion-sg"
  vpc_id = var.vpc_id

  # ssh access from anywhere
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    protocol = "-1"
    from_port = 0
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

#LoadBalancer sg
resource "aws_security_group" "alb" {
  name = "alb-sg"
  vpc_id = var.vpc_id

  # web access from anywhere
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    protocol = "-1"
    from_port = 0
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}