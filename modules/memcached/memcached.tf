resource "aws_elasticache_subnet_group" "default" {
  name       = var.elasticache_subnet_name
  subnet_ids = var.memcached_subnet_id
}

resource "aws_elasticache_replication_group" "default" {
  replication_group_id          = var.cluster_id
  replication_group_description = "Memcached Cluster"
  node_type                     = var.node_type
  port                          = 6379
  parameter_group_name          = "default.redis3.2.cluster.on"
  snapshot_retention_limit      = 5
  snapshot_window               = "00:00-05:00"
  security_group_ids            = var.memcached_security_group
  automatic_failover_enabled = true
  cluster_mode {
    replicas_per_node_group = 1
    num_node_groups         = var.node_groups
  }
}