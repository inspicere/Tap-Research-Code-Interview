variable "aws_region" {
    default = "us-east-1"
}

variable "aws_app_subnet_1_cidr" {
  description = "App hosts subnet"
  type        = string
  default     = "10.0.3.0/24"
}

variable "aws_db_subnet_1_cidr" {
  description = "AuroraDB Subnet"
  type        = string
  default     = "10.0.4.0/24"
}

variable "aws_db_subnet_2_cidr" {
  description = "AuroraDB Subnet"
  type        = string
  default     = "10.0.7.0/24"
}

variable "aws_memcached_subnet_1_cidr" {
  description = "Load Balancer Subnet"
  type        = string
  default     = "10.0.5.0/24"
}

variable "aws_network_cidr" {
  description = "VPC CIDR Range"
  type        = string
  default     = "10.0.0.0/16"
}

variable "aws_pub_subnet_1_cidr" {
  description = "Bastion hosts subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "aws_pub_subnet_2_cidr" {
  description = "ALB subnet"
  type        = string
  default     = "10.0.2.0/24"
}

variable "aws_redis_subnet_1_cidr" {
  description = "Redis Subnet"
  type        = string
  default     = "10.0.6.0/24"
}
