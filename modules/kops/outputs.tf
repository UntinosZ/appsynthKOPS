output "vpc_id" {
  value = "${aws_vpc.main.id}"
}

output "vpc_cidr" {
  value = "${aws_vpc.main.cidr_block}"
}

output "app_domain" {
  value = "test"
  # value = "${aws_route53_record.app_domain.name}"
}

output "private_zone_id" {
  value = "${aws_route53_zone.public.zone_id}"
}

output "privatesubnets" {
  value = "${join(",", list(aws_subnet.private1a.id, aws_subnet.private1b.id, aws_subnet.private1c.id))}"
}

output "publicsubnets" {
  value = "${join(",", list(aws_subnet.public1a.id, aws_subnet.public1b.id, aws_subnet.public1c.id))}"
}