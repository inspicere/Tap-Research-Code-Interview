##################################################################
# Redis is well redis
##################################################################
module "redis" {
  source = "../modules/redis/"
  redis_security_group    = [module.redis_tier.redis-sg-id]
  redis_subnet_id         = [module.redis_tier.redis_subnet_id]
  cluster_id              = "RedisCluster0"
  engine_version          = "3.2.10"
  node_type               = "cache.t2.micro"
  num_cache_nodes         = 3
  parameter_group_name    = "default.redis5.0"
  port                    = 6379
  apply_immediately       = true
  aws_redis_subnet_1_cidr = "10.0.6.0"
  elasticache_subnet_name = "redis-subnet"
}
