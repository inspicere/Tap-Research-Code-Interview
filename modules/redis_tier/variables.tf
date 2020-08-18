variable "aws_app_subnet_1_cidr" {
  description = "App hosts subnet"
  type        = string
}

variable "aws_redis_subnet_1_cidr" {
  description = "Redis Cluster Subnet"
  type        = string
}

variable "aws_network_cidr" {
  description = "VPC CIDR Range"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_id" {
  description = ""
  type        = string
}

