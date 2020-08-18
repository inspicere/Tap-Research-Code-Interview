##################################################################
# Memecached?
##################################################################
module "memcached" {
  source = "../modules/memcached/"
  memcached_security_group    = [module.memcached_tier.memcached-sg-id]
  memcached_subnet_id         = [module.memcached_tier.memcached_subnet_id]
  cluster_id                  = "memcachedCluster0"
  node_type                   = "cache.t2.micro"
  num_cache_nodes             = 3
  node_groups = "2"
  parameter_group_name        = "default.memcached1.4"
  port                        = 11211
  apply_immediately           = true
  elasticache_subnet_name     = "memcached-subnet"
  engine_version = "1.4.0"
}
