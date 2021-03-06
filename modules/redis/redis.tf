resource "aws_elasticache_subnet_group" "default" {
  name       = var.elasticache_subnet_name
  subnet_ids = var.redis_subnet_id
}

resource "aws_elasticache_replication_group" "default" {
  replication_group_id          = var.cluster_id
  replication_group_description = "Redis cluster"
  node_type                     = var.node_type
  port                          = 6379
  engine_version                = var.engine_version
  parameter_group_name          = var.parameter_group_name
  snapshot_retention_limit      = 5
  snapshot_window               = "00:00-05:00"
  subnet_group_name             = aws_elasticache_subnet_group.default.name
  security_group_ids            = var.redis_security_group
  automatic_failover_enabled    = true
  cluster_mode {
    replicas_per_node_group = 1
    num_node_groups         = var.node_groups
  }
}