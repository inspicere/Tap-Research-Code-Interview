terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

##################################################################
# Data sources to get VPC, subnet, security group and AMI details
##################################################################
data "aws_vpc" "default" {
  default = true
}

data "aws_subnet_ids" "all" {
  vpc_id = data.aws_vpc.default.id
}


##################################################################
# Yay networking and security
##################################################################

/* module "security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 3.0"

  name        = "example"
  description = "Security group for example usage with EC2 instance"
  vpc_id      = data.aws_vpc.default.id

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["http-80-tcp", "all-icmp, ssh-22-tcp"]
  egress_rules        = ["all-all"]
}

resource "aws_eip" "this" {
  vpc      = true
  instance = module.ec2.id[0]
}
*/

##################################################################
# Got keys?
##################################################################

resource "aws_key_pair" "das-key" {
  key_name   = "inspicere"
#  public_key = "file(./id_rsa.pub)"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCjZbUdEFxClaY46OweuACbjczrzyyzP8hSLMbqPXRmoIXyV5oK03DynEq8nzMqSxtrR8admUw5GFb9nfCz+/wCtUsGYr5sMPlhacYs0/PL8WctZ7PzVjHGyOSA61sM9lsO55BNGUbHaR5wbCkJ3A7YesU+SQjIp8qFZwSwkwzNr194nrWdI1+fnxWaXPABNxqSRKRSn36CQfEOEEVdLuufoiI451ddoHTSf6DiGOmab01vBxOrNKo30yhm/EwbTvGcuO3dh9MXOniaGbLZINAOFHbaxhJobGzxIydeOXF0cTweduTsooWHlJiZzHQ3ldtJ24wEkl7OvJo3w1b2URTD inspicere@crow"
}

##################################################################
# Create an ec2 t2.micro nginx instance
##################################################################

module "ec2" {
  source = "../"

  instance_count = 3

  name          = "EC2-Example-Terraform-"
  ami           = "ami-05c0d7f3fffb419c8"
 
  instance_type = "t2.micro"
  key_name      = "inspicere"
  subnet_id     = tolist(data.aws_subnet_ids.all.ids)[0]
#  private_ips                 = ["172.31.32.5", "172.31.46.20"]
#  vpc_security_group_ids      = [module.security_group.this_security_group_id]
  associate_public_ip_address = true

  tags = {
    "Env"      = "Testing"
    "Location" = "/dev/null"
  }
}

