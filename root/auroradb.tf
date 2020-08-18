##################################################################
# RDS AuroraDB
##################################################################
module "aurora" {
  source = "../modules/db/"
  name                                = "auroradb-cluster"
  engine                              = "aurora-mysql"
  engine_version                      = "5.7.12"
  subnets                             = module.db_tier.db_subnet_id
  vpc_id                              = data.aws_vpc.default.id
  replica_count                       = 0
  instance_type                       = "db.t2.medium"
  apply_immediately                   = true
  skip_final_snapshot                 = true
  db_parameter_group_name             = aws_db_parameter_group.aurora_db_pg.id
  db_cluster_parameter_group_name     = aws_rds_cluster_parameter_group.aurora_cluster_pg.id
  iam_database_authentication_enabled = true
  enabled_cloudwatch_logs_exports     = ["audit", "error", "general", "slowquery"]
  allowed_cidr_blocks                 = ["10.0.3.0/24", "10.0.1.0/24"]
  create_security_group = true
  database_name = ""
  db_subnet_group_name = ""
  engine_mode = ""
  global_cluster_identifier = ""
  iam_roles = ""
  replication_source_identifier = ""
  source_region = ""
  tags = ""
  username = ""
  vpc_security_group_ids = ""
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