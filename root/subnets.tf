##################################################################
# Build out the VPC Subnets cause routes and what not ^_^
##################################################################

module "vpc" {
  source = "../modules/vpc/"
  aws_network_cidr = "10.0.0.0/16"
}

module "public_tier" {
  source = "../modules/public_tier/"
  vpc_id = module.vpc.vpc_id
  igw_id = module.vpc.igw_id
  aws_pub_subnet_1_cidr = "10.0.1.0/24"
  aws_pub_subnet_2_cidr = "10.0.2.0/24"
}

module "app_tier" {
  source                = "../modules/app_tier/"
  vpc_id                = module.vpc.vpc_id
  nat_gateway_id        = module.public_tier.nat_gateway_id
  aws_pub_subnet_1_cidr = "10.0.1.0/24"
  aws_pub_subnet_2_cidr = "10.0.2.0/24"
  aws_app_subnet_1_cidr = "10.0.3.0/24"
  aws_db_subnet_1_cidr  = "10.0.4.0/24"
}

module "db_tier" {
  source                = "../modules/db_tier/"
  vpc_id                = module.vpc.vpc_id
  aws_pub_subnet_1_cidr = "10.0.1.0/24"
  aws_app_subnet_1_cidr = "10.0.3.0/24"
  aws_db_subnet_1_cidr  = "10.0.4.0/24"
  aws_db_subnet_2_cidr  = "10.0.7.0/24"
}

module "memcached_tier" {
  source                      = "../modules/memcached_tier/"
  vpc_id                      = module.vpc.vpc_id
  aws_app_subnet_1_cidr       = var.aws_app_subnet_1_cidr
  aws_memcached_subnet_1_cidr = "10.0.5.0/24"
}

module "redis_tier" {
  source                  = "../modules/redis_tier/"
  vpc_id                  = module.vpc.vpc_id
  aws_app_subnet_1_cidr   = "10.0.3.0/24"
  aws_redis_subnet_1_cidr = "10.0.6.0/24"
}



