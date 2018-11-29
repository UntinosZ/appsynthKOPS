terraform {
  backend "s3" {
    bucket = "tf-state-secret"
    region = "ap-southeast-1"
    key    = "kops-state.tfstate"
  }
}

provider "aws" {
  region = "${var.region}"
}

provider "aws" {
  region = "ap-southeast-1"
  alias  = "ap-southeast-1"
}

module "kops" {
  source                      = "../modules/kops"
  cluster_name                = "${local.cluster_name}"
  description                 = "${var.description}"
  region                      = "${var.region}"
  availability_zones          = "${var.availability_zones}"
  vpc_cidr                    = "${var.vpc_cidr}"
  key_name                    = "${var.key_name}"
  zone_domain                 = "${var.zone_domain}"
  s3_bucket_name              = "${var.s3_bucket_name}"
  force_destroy_s3            = "${var.force_destroy_s3}"
  app_domain                  = "${var.app_domain}"
  instance_type               = "${var.instance_type}"
  database_name               = "${var.database_name}"
  database_username           = "${var.database_username}"
  database_password           = "${var.database_password}"

  providers {
    # for object in s3 secret bucket
    aws.ap-southeast-1 = "aws.ap-southeast-1"
  }
}

output "cluster_name" {
  value = "${local.cluster_name}"
}

output "region" {
  value = "${var.region}"
}

output "vpc_id" {
  value = "${module.kops.vpc_id}"
}

output "vpc_cidr" {
  value = "${module.kops.vpc_cidr}"
}

output "app_domain" {
  value = "${var.app_domain}"
}

output "state_store" {
  value = "s3://${var.state_store}"
}

output "availability_zones" {
  value = "${var.availability_zones}"
}

output "private_zone_id" {
  value = "${module.kops.private_zone_id}"
}

output "publicsubnets" {
  value = "${module.kops.publicsubnets}"
}

output "privatesubnets" {
  value = "${module.kops.privatesubnets}"
}

output "public_key" {
  value = "${var.public_key}"
}
