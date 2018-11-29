variable "cluster_name" {}

variable "description" {}

variable "vpc_cidr" {}

variable "region" {}

variable "availability_zones" {
  type = "list"
}

variable "key_name" {}

variable "s3_bucket_name" {}

variable "instance_type" {}

variable "app_domain" {}

variable "zone_domain" {}

variable "force_destroy_s3" {}

variable "database_name" {}

variable "database_username" {}

variable "database_password" {}