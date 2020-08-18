#### DB subnets
resource "aws_subnet" "aurora_db_subnet_1" {
  vpc_id = var.vpc_id
  cidr_block = var.aws_db_subnet_1_cidr
  tags = {
    Name = "DB subnet 1"
    Subnet = "DB"
  }
}

resource "aws_subnet" "aurora_db_subnet_2" {
  vpc_id = var.vpc_id
  cidr_block = var.aws_db_subnet_2_cidr
  tags = {
    Name = "DB subnet 2"
    Subnet = "DB"
  }
}

### SECURITY GROUP
resource "aws_security_group" "auroradb_sg" {
  name = "db-sg"
  vpc_id = var.vpc_id

  # TCP access only from app subnet and bastion host
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = [
      var.aws_app_subnet_1_cidr, # app subnet
      var.aws_pub_subnet_1_cidr, # Public subnet for bastion host debug
    ]
  }

  # Egress to internal
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["10.0.0.0/16"]
  }
}
