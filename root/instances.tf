##################################################################
# Create an ec2 t2.micro nginx instance
##################################################################

module "ec2-bastion" {
  source = "../modules/ec2"
  instance_count = 1
  name          = "EC2-Bastion-"
  ami           = "ami-05c0d7f3fffb419c8"
  instance_type = "t2.micro"
  key_name      = "inspicere"
  subnet_id     = module.public_tier.bastion_subnet_id
  associate_public_ip_address = true
  tags = {
    "Env"      = "Testing"
    "Location" = "/dev/null"
  }
}

module "ec2-web" {
  source = "../modules/ec2/"
  instance_count = 3
  name          = "EC2-web-"
  ami           = "ami-05c0d7f3fffb419c8"
  instance_type = "t2.micro"
  key_name      = "inspicere"
  subnet_id     = module.app_tier.app_subnet_id
  associate_public_ip_address = false
  tags = {
    "Env"      = "Testing"
    "Location" = "/dev/null"
    "Role"     = "Web"
  }
}
