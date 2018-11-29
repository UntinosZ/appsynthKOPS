resource "aws_elasticache_cluster" "main" {
  cluster_id           = "${var.cluster_name}"
  engine               = "memcached"
  node_type            = "cache.m4.large"
  num_cache_nodes      = 2
  parameter_group_name = "default.memcached1.5"
  port                 = 11211
}