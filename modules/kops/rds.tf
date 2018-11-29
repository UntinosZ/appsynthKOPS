resource "aws_rds_cluster" "main" {
  cluster_identifier        = "${var.cluster_name}"
  engine                    = "aurora-mysql"
  availability_zones        = "${var.availability_zones}"
  database_name             = "${var.database_name}"
  master_username           = "${var.database_username}"
  master_password           = "${var.database_password}"
  backup_retention_period   = 5
  preferred_backup_window   = "07:00-09:00"
  skip_final_snapshot       = "true"
  db_subnet_group_name      = "${aws_db_subnet_group.kops_default.id}"
}

resource "aws_rds_cluster_instance" "cluster_instances" {
  count                     = 2
  identifier                = "${var.cluster_name}-${count.index}"
  cluster_identifier        = "${aws_rds_cluster.main.id}"
  instance_class            = "db.r4.large"
  engine                    = "aurora-mysql"
  db_parameter_group_name   = "default.aurora-mysql5.7"
}

resource "aws_db_subnet_group" "kops_default" {
  name       = "${var.cluster_name}-subnet"
  subnet_ids = ["${list(aws_subnet.private1a.id, aws_subnet.private1b.id, aws_subnet.private1c.id)}"]

  tags {
    Name = "${var.cluster_name}-subnetgroup"
  }
}