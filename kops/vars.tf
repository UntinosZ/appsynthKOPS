locals {
  cluster_name = "kops-test"
}

variable "description" {
  default = "Test create Kubernes KOPS with Terraform"
}

variable "vpc_cidr" {
  default = "10.0.22.0/24"
}

variable "key_name" {
  default = "id_rsa"
}

variable "s3_bucket_name" {
  default = "test-eb-state"
}

variable "instance_type" {
  default = "t2.small"
}

variable "app_domain" {
  default = "kop.dev.ekoapp.com"
}

variable "zone_domain" {
  default = "kops.dev.ekoapp.com"
}

variable "region" {
  default = "ap-southeast-1"
}

variable "availability_zones" {
  default = ["ap-southeast-1a", "ap-southeast-1b", "ap-southeast-1c"]
}

variable "force_destroy_s3" {
  default = "false"
}

variable "state_store" {
  default = "tf-state-secret"
}

variable "database_name" {
  default = "kops_test"
}

variable "database_username" {
  default = "kops_user"
}

variable "database_password" {
  default = "password"
}

variable "public_key" {
  default = "/Users/name/.ssh/id_rsa.pub"
}