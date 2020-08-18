variable "aws_app_subnet_1_cidr" {
  description = "App hosts subnet"
  type        = string
}

variable "aws_db_subnet_1_cidr" {
  description = "AuroraDB Subnet"
  type        = string
}

variable "aws_db_subnet_2_cidr" {
  description = "AuroraDB Subnet"
  type        = string
}

variable "aws_network_cidr" {
  description = "VPC CIDR Range"
  type        = string
  default     = "10.0.0.0/16"
}

variable "aws_pub_subnet_1_cidr" {
  description = "Bastion hosts subnet"
  type        = string
}

variable "vpc_id" {
  description = ""
  type        = string
}


