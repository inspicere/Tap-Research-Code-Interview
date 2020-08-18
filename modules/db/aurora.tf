resource "aws_db_subnet_group" "this" {
  name        = var.db_subnet_group_name
  description = "Aurora cluster subnet group"
  subnet_ids  = [var.subnets]
  tags = merge(var.tags, {
    Name = var.db_subnet_group_name
  })
}

resource "aws_db_parameter_group" "default" {
  name   = var.db_parameter_group_name
  family = "mysql5.7"
}

resource "aws_rds_cluster" "this" {
  cluster_identifier                  = var.name
  engine                              = var.engine
  engine_version                      = var.engine_version
  database_name                       = var.database_name
  master_username                     = var.master_username
  master_password                     = var.master_password
  port                                = var.port
  db_subnet_group_name                = var.db_subnet_group_name
  apply_immediately                   = var.apply_immediately
  db_cluster_parameter_group_name     = var.db_cluster_parameter_group_name
  tags = var.tags
}

resource "aws_rds_cluster_instance" "this" {
  count = var.replica_count
  cluster_identifier              = aws_rds_cluster.this.id
  engine                          = var.engine
  engine_version                  = var.engine_version
  instance_class                  = var.instance_type
  publicly_accessible             = var.publicly_accessible
  db_subnet_group_name            = var.db_subnet_group_name
  db_parameter_group_name         = var.db_parameter_group_name
  apply_immediately               = var.apply_immediately
  tags = var.tags
}
