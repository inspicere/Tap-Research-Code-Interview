variable "aws_redis_subnet_1_cidr" {
  description = "Load Balancer Subnet"
  type        = string
}

variable "apply_immediately" {
  description = "Defaults to False"
}

variable "cidr_blocks" {
  description = "The CIDR blocks to create the workstations in."
  default     = ["10.1.1.0/24"]
}

variable "cluster_id" {
  description = "Id to assign the new cluster"
  type        = string
}

variable "elasticache_subnet_name" {
  description = "Name of the Elasticache subnet group"
  type        = string
}
variable "engine_version" {
  description = "Redis Endine to use"
  default     = 6379
}

variable "port" {
  description = "Port to use for Redis"
  default     = 6379
}


variable "node_groups" {
  description = "Number of nodes groups to create in the cluster"
  default     = 2
}

variable "num_cache_nodes" {
  description = "Number of cache nodes to create in the cluster"
  default     = 6
}

variable "node_type" {
  description = "Number of nodes groups to create in the cluster"
  default     = "cache.t2.micro"
}
variable "parameter_group_name" {
  description = "Number of nodes groups to create in the cluster"
  default     = "default.redis5.0.cluster.on"
}

variable "redis_subnet_id" {
  description = ""
}

variable "redis_security_group" {
  description = ""
}


