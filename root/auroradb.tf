##################################################################
# RDS AuroraDB
##################################################################
module "aurora" {
  source = "../modules/db/"
  name                                = "auroradb-cluster"
  engine                              = "aurora-mysql"
  engine_version                      = "5.7.12"
  subnets                             = module.db_tier.db_subnet_ids
  replica_count                       = 3
  instance_type                       = "db.t2.micro"
  apply_immediately                   = true
  db_parameter_group_name             = aws_db_parameter_group.aurora_db_pg.id
  db_cluster_parameter_group_name     = aws_rds_cluster_parameter_group.aurora_cluster_pg.id
  enabled_cloudwatch_logs_exports     = ["audit", "error", "general", "slowquery"]
  database_name                       = "mylittledatabase"
  master_username                     = "user"
  master_password                     = "password"
  db_subnet_group_name                = module.db_tier.db_subnet_group_name
  publicly_accessible                 = "false"
  port                                = "3306"
  tags = {
    Env = "Dev"
    Location = "/dev/urandom"
  }
}

resource "aws_db_parameter_group" "aurora_db_pg" {
  name        = "aurora-db-parameter-group"
  family      = "aurora-mysql5.7"
  description = "aurora-db-parameter-group"
}

resource "aws_rds_cluster_parameter_group" "aurora_cluster_pg" {
  name        = "aurora-cluster-parameter-group"
  family      = "aurora-mysql5.7"
  description = "aurora-cluster-parameter-group"
}
