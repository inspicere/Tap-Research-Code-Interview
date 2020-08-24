terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = var.aws_region
}

##################################################################
# Data sources to get VPC, subnet, security group and AMI details
##################################################################

data "aws_vpc" "default" {
  default = true
}

##################################################################
# Got keys?
##################################################################

resource "aws_key_pair" "das-key" {
  key_name   = "inspicere"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCjZbUdEFxClaY46OweuACbjczrzyyzP8hSLMbqPXRmoIXyV5oK03DynEq8nzMqSxtrR8admUw5GFb9nfCz+/wCtUsGYr5sMPlhacYs0/PL8WctZ7PzVjHGyOSA61sM9lsO55BNGUbHaR5wbCkJ3A7YesU+SQjIp8qFZwSwkwzNr194nrWdI1+fnxWaXPABNxqSRKRSn36CQfEOEEVdLuufoiI451ddoHTSf6DiGOmab01vBxOrNKo30yhm/EwbTvGcuO3dh9MXOniaGbLZINAOFHbaxhJobGzxIydeOXF0cTweduTsooWHlJiZzHQ3ldtJ24wEkl7OvJo3w1b2URTD inspicere@crow"
}

