variable "apply_immediately" {
  description = ""
}

variable "database_name" {
  description = ""
}

variable "db_cluster_parameter_group_name" {
  description = ""
}

variable "db_parameter_group_name" {
  description = ""
}

variable "db_subnet_group_name" {
  description = "A DB subnet group to associate with this DB instance."
}

variable "enabled_cloudwatch_logs_exports" {
  description = "Enabled exports for cloudwatch"
  default     = ["error", "general"]
}
variable "engine" {
  description = ""
}

variable "engine_version" {
  description = ""
}

variable "instance_type" {
  description = ""
}

variable "master_username" {
  description = ""
  type        = string
}

variable "master_password" {
  description = ""
  type        = string
}

variable "name" {
  description = ""
  type        = string
}

variable "port" {
  description = ""
  type        = string
}

variable "publicly_accessible" {
  description = ""
}

variable "replica_count" {
  description = ""
  default     = 0
}

variable "subnets" {
  description = "Aurora DB Subnet ID's"
  type        = string
}

variable "tags" {
  description = ""
}



