variable "aws_app_subnet_1_cidr" {
  description = "App hosts subnet"
  type        = string
}

variable "aws_pub_subnet_2_cidr" {
  description = "Load Balancer Subnet"
  type        = string
}

variable "vpc_id" {
  description = ""
  type        = string
}