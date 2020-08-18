variable "aws_pub_subnet_1_cidr" {
  description = "Bastion hosts subnet"
  type        = string
}

variable "aws_pub_subnet_2_cidr" {
  description = "Load Balancer Subnet"
  type        = string
}

variable "aws_network_cidr" {
  description = "VPC CIDR Range"
  type        = string
  default     = "10.0.0.0/16"
}

variable "igw_id" {
  description = "Internet Gateway ID"
  type        = string
}

variable "vpc_id" {
  description = ""
  type        = string
}

