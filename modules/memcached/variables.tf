variable "apply_immediately" {
  description = "Defaults to False"
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
  description = ""
  type        = string
}

variable "memcached_security_group" {
  description = ""
}
variable "memcached_subnet_id" {
  description = ""
}

variable "node_groups" {
  description = "Number of nodes groups to create in the cluster"
  default     = 2
}

variable "node_type" {
  description = "Number of nodes groups to create in the cluster"
  default     = "cache.t2.micro"
}

variable "num_cache_nodes" {
  description = "Number of cache nodes to create in the cluster"
  default     = 6
}

variable "parameter_group_name" {
  description = "Number of nodes groups to create in the cluster"
  default     = "default.memcached1.4"
}

variable "port" {
  description = "Port to use for Memecached"
  default     = 11211
}