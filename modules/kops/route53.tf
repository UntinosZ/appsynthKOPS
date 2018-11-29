# Private Hosted Zone
resource "aws_route53_zone" "public" {
  name    = "${var.zone_domain}"
  vpc_id  = "${aws_vpc.main.id}"
  comment = "${var.cluster_name}, Managed by Terraform."

  tags {
    Customer = "${var.cluster_name}"
  }
}
