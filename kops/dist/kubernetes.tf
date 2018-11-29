locals = {
  bastion_autoscaling_group_ids     = ["${aws_autoscaling_group.bastions-kops-test-local.id}"]
  bastion_security_group_ids        = ["${aws_security_group.bastion-kops-test-local.id}"]
  bastions_role_arn                 = "${aws_iam_role.bastions-kops-test-local.arn}"
  bastions_role_name                = "${aws_iam_role.bastions-kops-test-local.name}"
  cluster_name                      = "kops-test.local"
  master_autoscaling_group_ids      = ["${aws_autoscaling_group.master-ap-southeast-1b-masters-kops-test-local.id}"]
  master_security_group_ids         = ["${aws_security_group.masters-kops-test-local.id}"]
  masters_role_arn                  = "${aws_iam_role.masters-kops-test-local.arn}"
  masters_role_name                 = "${aws_iam_role.masters-kops-test-local.name}"
  node_autoscaling_group_ids        = ["${aws_autoscaling_group.nodes-kops-test-local.id}"]
  node_security_group_ids           = ["${aws_security_group.nodes-kops-test-local.id}"]
  node_subnet_ids                   = ["subnet-0c0060646837730d4", "subnet-0d51e5be9dfc3a82e", "subnet-0ec9074a6c3bdf2e7"]
  nodes_role_arn                    = "${aws_iam_role.nodes-kops-test-local.arn}"
  nodes_role_name                   = "${aws_iam_role.nodes-kops-test-local.name}"
  region                            = "ap-southeast-1"
  subnet_ap-southeast-1a_id         = "subnet-0c0060646837730d4"
  subnet_ap-southeast-1b_id         = "subnet-0ec9074a6c3bdf2e7"
  subnet_ap-southeast-1c_id         = "subnet-0d51e5be9dfc3a82e"
  subnet_ids                        = ["subnet-01effe0b1d29f1a27", "subnet-07ba8e191c471d987", "subnet-0c0060646837730d4", "subnet-0cf299e79d50b84e5", "subnet-0d51e5be9dfc3a82e", "subnet-0ec9074a6c3bdf2e7"]
  subnet_utility-ap-southeast-1a_id = "subnet-0cf299e79d50b84e5"
  subnet_utility-ap-southeast-1b_id = "subnet-07ba8e191c471d987"
  subnet_utility-ap-southeast-1c_id = "subnet-01effe0b1d29f1a27"
  vpc_id                            = "vpc-0e8d86765e844b177"
}

output "bastion_autoscaling_group_ids" {
  value = ["${aws_autoscaling_group.bastions-kops-test-local.id}"]
}

output "bastion_security_group_ids" {
  value = ["${aws_security_group.bastion-kops-test-local.id}"]
}

output "bastions_role_arn" {
  value = "${aws_iam_role.bastions-kops-test-local.arn}"
}

output "bastions_role_name" {
  value = "${aws_iam_role.bastions-kops-test-local.name}"
}

output "cluster_name" {
  value = "kops-test.local"
}

output "master_autoscaling_group_ids" {
  value = ["${aws_autoscaling_group.master-ap-southeast-1b-masters-kops-test-local.id}"]
}

output "master_security_group_ids" {
  value = ["${aws_security_group.masters-kops-test-local.id}"]
}

output "masters_role_arn" {
  value = "${aws_iam_role.masters-kops-test-local.arn}"
}

output "masters_role_name" {
  value = "${aws_iam_role.masters-kops-test-local.name}"
}

output "node_autoscaling_group_ids" {
  value = ["${aws_autoscaling_group.nodes-kops-test-local.id}"]
}

output "node_security_group_ids" {
  value = ["${aws_security_group.nodes-kops-test-local.id}"]
}

output "node_subnet_ids" {
  value = ["subnet-0c0060646837730d4", "subnet-0d51e5be9dfc3a82e", "subnet-0ec9074a6c3bdf2e7"]
}

output "nodes_role_arn" {
  value = "${aws_iam_role.nodes-kops-test-local.arn}"
}

output "nodes_role_name" {
  value = "${aws_iam_role.nodes-kops-test-local.name}"
}

output "region" {
  value = "ap-southeast-1"
}

output "subnet_ap-southeast-1a_id" {
  value = "subnet-0c0060646837730d4"
}

output "subnet_ap-southeast-1b_id" {
  value = "subnet-0ec9074a6c3bdf2e7"
}

output "subnet_ap-southeast-1c_id" {
  value = "subnet-0d51e5be9dfc3a82e"
}

output "subnet_ids" {
  value = ["subnet-01effe0b1d29f1a27", "subnet-07ba8e191c471d987", "subnet-0c0060646837730d4", "subnet-0cf299e79d50b84e5", "subnet-0d51e5be9dfc3a82e", "subnet-0ec9074a6c3bdf2e7"]
}

output "subnet_utility-ap-southeast-1a_id" {
  value = "subnet-0cf299e79d50b84e5"
}

output "subnet_utility-ap-southeast-1b_id" {
  value = "subnet-07ba8e191c471d987"
}

output "subnet_utility-ap-southeast-1c_id" {
  value = "subnet-01effe0b1d29f1a27"
}

output "vpc_id" {
  value = "vpc-0e8d86765e844b177"
}

provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_autoscaling_attachment" "bastions-kops-test-local" {
  elb                    = "${aws_elb.bastion-kops-test-local.id}"
  autoscaling_group_name = "${aws_autoscaling_group.bastions-kops-test-local.id}"
}

resource "aws_autoscaling_attachment" "master-ap-southeast-1b-masters-kops-test-local" {
  elb                    = "${aws_elb.api-kops-test-local.id}"
  autoscaling_group_name = "${aws_autoscaling_group.master-ap-southeast-1b-masters-kops-test-local.id}"
}

resource "aws_autoscaling_group" "bastions-kops-test-local" {
  name                 = "bastions.kops-test.local"
  launch_configuration = "${aws_launch_configuration.bastions-kops-test-local.id}"
  max_size             = 1
  min_size             = 1
  vpc_zone_identifier  = ["subnet-0cf299e79d50b84e5", "subnet-07ba8e191c471d987", "subnet-01effe0b1d29f1a27"]

  tag = {
    key                 = "KubernetesCluster"
    value               = "kops-test.local"
    propagate_at_launch = true
  }

  tag = {
    key                 = "Name"
    value               = "bastions.kops-test.local"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"
    value               = "bastions"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/role/bastion"
    value               = "1"
    propagate_at_launch = true
  }

  metrics_granularity = "1Minute"
  enabled_metrics     = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
}

resource "aws_autoscaling_group" "master-ap-southeast-1b-masters-kops-test-local" {
  name                 = "master-ap-southeast-1b.masters.kops-test.local"
  launch_configuration = "${aws_launch_configuration.master-ap-southeast-1b-masters-kops-test-local.id}"
  max_size             = 1
  min_size             = 1
  vpc_zone_identifier  = ["subnet-0ec9074a6c3bdf2e7"]

  tag = {
    key                 = "KubernetesCluster"
    value               = "kops-test.local"
    propagate_at_launch = true
  }

  tag = {
    key                 = "Name"
    value               = "master-ap-southeast-1b.masters.kops-test.local"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"
    value               = "master-ap-southeast-1b"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/role/master"
    value               = "1"
    propagate_at_launch = true
  }

  metrics_granularity = "1Minute"
  enabled_metrics     = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
}

resource "aws_autoscaling_group" "nodes-kops-test-local" {
  name                 = "nodes.kops-test.local"
  launch_configuration = "${aws_launch_configuration.nodes-kops-test-local.id}"
  max_size             = 3
  min_size             = 3
  vpc_zone_identifier  = ["subnet-0c0060646837730d4", "subnet-0ec9074a6c3bdf2e7", "subnet-0d51e5be9dfc3a82e"]

  tag = {
    key                 = "KubernetesCluster"
    value               = "kops-test.local"
    propagate_at_launch = true
  }

  tag = {
    key                 = "Name"
    value               = "nodes.kops-test.local"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"
    value               = "nodes"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/role/node"
    value               = "1"
    propagate_at_launch = true
  }

  metrics_granularity = "1Minute"
  enabled_metrics     = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
}

resource "aws_ebs_volume" "b-etcd-events-kops-test-local" {
  availability_zone = "ap-southeast-1b"
  size              = 20
  type              = "gp2"
  encrypted         = false

  tags = {
    KubernetesCluster                       = "kops-test.local"
    Name                                    = "b.etcd-events.kops-test.local"
    "k8s.io/etcd/events"                    = "b/b"
    "k8s.io/role/master"                    = "1"
    "kubernetes.io/cluster/kops-test.local" = "owned"
  }
}

resource "aws_ebs_volume" "b-etcd-main-kops-test-local" {
  availability_zone = "ap-southeast-1b"
  size              = 20
  type              = "gp2"
  encrypted         = false

  tags = {
    KubernetesCluster                       = "kops-test.local"
    Name                                    = "b.etcd-main.kops-test.local"
    "k8s.io/etcd/main"                      = "b/b"
    "k8s.io/role/master"                    = "1"
    "kubernetes.io/cluster/kops-test.local" = "owned"
  }
}

resource "aws_elb" "api-kops-test-local" {
  name = "api-kops-test-local-b5iacr"

  listener = {
    instance_port     = 443
    instance_protocol = "TCP"
    lb_port           = 443
    lb_protocol       = "TCP"
  }

  security_groups = ["${aws_security_group.api-elb-kops-test-local.id}"]
  subnets         = ["subnet-01effe0b1d29f1a27", "subnet-07ba8e191c471d987", "subnet-0cf299e79d50b84e5"]

  health_check = {
    target              = "SSL:443"
    healthy_threshold   = 2
    unhealthy_threshold = 2
    interval            = 10
    timeout             = 5
  }

  idle_timeout = 300

  tags = {
    KubernetesCluster = "kops-test.local"
    Name              = "api.kops-test.local"
  }
}

resource "aws_elb" "bastion-kops-test-local" {
  name = "bastion-kops-test-local-aqb8a5"

  listener = {
    instance_port     = 22
    instance_protocol = "TCP"
    lb_port           = 22
    lb_protocol       = "TCP"
  }

  security_groups = ["${aws_security_group.bastion-elb-kops-test-local.id}"]
  subnets         = ["subnet-01effe0b1d29f1a27", "subnet-07ba8e191c471d987", "subnet-0cf299e79d50b84e5"]

  health_check = {
    target              = "TCP:22"
    healthy_threshold   = 2
    unhealthy_threshold = 2
    interval            = 10
    timeout             = 5
  }

  idle_timeout = 300

  tags = {
    KubernetesCluster = "kops-test.local"
    Name              = "bastion.kops-test.local"
  }
}

resource "aws_iam_instance_profile" "bastions-kops-test-local" {
  name = "bastions.kops-test.local"
  role = "${aws_iam_role.bastions-kops-test-local.name}"
}

resource "aws_iam_instance_profile" "masters-kops-test-local" {
  name = "masters.kops-test.local"
  role = "${aws_iam_role.masters-kops-test-local.name}"
}

resource "aws_iam_instance_profile" "nodes-kops-test-local" {
  name = "nodes.kops-test.local"
  role = "${aws_iam_role.nodes-kops-test-local.name}"
}

resource "aws_iam_role" "bastions-kops-test-local" {
  name               = "bastions.kops-test.local"
  assume_role_policy = "${file("${path.module}/data/aws_iam_role_bastions.kops-test.local_policy")}"
}

resource "aws_iam_role" "masters-kops-test-local" {
  name               = "masters.kops-test.local"
  assume_role_policy = "${file("${path.module}/data/aws_iam_role_masters.kops-test.local_policy")}"
}

resource "aws_iam_role" "nodes-kops-test-local" {
  name               = "nodes.kops-test.local"
  assume_role_policy = "${file("${path.module}/data/aws_iam_role_nodes.kops-test.local_policy")}"
}

resource "aws_iam_role_policy" "bastions-kops-test-local" {
  name   = "bastions.kops-test.local"
  role   = "${aws_iam_role.bastions-kops-test-local.name}"
  policy = "${file("${path.module}/data/aws_iam_role_policy_bastions.kops-test.local_policy")}"
}

resource "aws_iam_role_policy" "masters-kops-test-local" {
  name   = "masters.kops-test.local"
  role   = "${aws_iam_role.masters-kops-test-local.name}"
  policy = "${file("${path.module}/data/aws_iam_role_policy_masters.kops-test.local_policy")}"
}

resource "aws_iam_role_policy" "nodes-kops-test-local" {
  name   = "nodes.kops-test.local"
  role   = "${aws_iam_role.nodes-kops-test-local.name}"
  policy = "${file("${path.module}/data/aws_iam_role_policy_nodes.kops-test.local_policy")}"
}

resource "aws_key_pair" "kubernetes-kops-test-local-ee838b59608155a2d80ccc4feb8d9155" {
  key_name   = "kubernetes.kops-test.local-ee:83:8b:59:60:81:55:a2:d8:0c:cc:4f:eb:8d:91:55"
  public_key = "${file("${path.module}/data/aws_key_pair_kubernetes.kops-test.local-ee838b59608155a2d80ccc4feb8d9155_public_key")}"
}

resource "aws_launch_configuration" "bastions-kops-test-local" {
  name_prefix                 = "bastions.kops-test.local-"
  image_id                    = "ami-0856dbf77f7ffb494"
  instance_type               = "t2.micro"
  key_name                    = "${aws_key_pair.kubernetes-kops-test-local-ee838b59608155a2d80ccc4feb8d9155.id}"
  iam_instance_profile        = "${aws_iam_instance_profile.bastions-kops-test-local.id}"
  security_groups             = ["${aws_security_group.bastion-kops-test-local.id}"]
  associate_public_ip_address = true

  root_block_device = {
    volume_type           = "gp2"
    volume_size           = 32
    delete_on_termination = true
  }

  lifecycle = {
    create_before_destroy = true
  }

  enable_monitoring = false
}

resource "aws_launch_configuration" "master-ap-southeast-1b-masters-kops-test-local" {
  name_prefix                 = "master-ap-southeast-1b.masters.kops-test.local-"
  image_id                    = "ami-0856dbf77f7ffb494"
  instance_type               = "t2.small"
  key_name                    = "${aws_key_pair.kubernetes-kops-test-local-ee838b59608155a2d80ccc4feb8d9155.id}"
  iam_instance_profile        = "${aws_iam_instance_profile.masters-kops-test-local.id}"
  security_groups             = ["${aws_security_group.masters-kops-test-local.id}"]
  associate_public_ip_address = false
  user_data                   = "${file("${path.module}/data/aws_launch_configuration_master-ap-southeast-1b.masters.kops-test.local_user_data")}"

  root_block_device = {
    volume_type           = "gp2"
    volume_size           = 64
    delete_on_termination = true
  }

  lifecycle = {
    create_before_destroy = true
  }

  enable_monitoring = false
}

resource "aws_launch_configuration" "nodes-kops-test-local" {
  name_prefix                 = "nodes.kops-test.local-"
  image_id                    = "ami-0856dbf77f7ffb494"
  instance_type               = "t2.micro"
  key_name                    = "${aws_key_pair.kubernetes-kops-test-local-ee838b59608155a2d80ccc4feb8d9155.id}"
  iam_instance_profile        = "${aws_iam_instance_profile.nodes-kops-test-local.id}"
  security_groups             = ["${aws_security_group.nodes-kops-test-local.id}"]
  associate_public_ip_address = false
  user_data                   = "${file("${path.module}/data/aws_launch_configuration_nodes.kops-test.local_user_data")}"

  root_block_device = {
    volume_type           = "gp2"
    volume_size           = 128
    delete_on_termination = true
  }

  lifecycle = {
    create_before_destroy = true
  }

  enable_monitoring = false
}

resource "aws_route53_record" "api-kops-test-local" {
  name = "api.kops-test.local"
  type = "A"

  alias = {
    name                   = "${aws_elb.api-kops-test-local.dns_name}"
    zone_id                = "${aws_elb.api-kops-test-local.zone_id}"
    evaluate_target_health = false
  }

  zone_id = "/hostedzone/Z1N5FTREX7LSX"
}

resource "aws_route53_record" "bastion-kops-test-local" {
  name = "bastion.kops-test.local"
  type = "A"

  alias = {
    name                   = "${aws_elb.bastion-kops-test-local.dns_name}"
    zone_id                = "${aws_elb.bastion-kops-test-local.zone_id}"
    evaluate_target_health = false
  }

  zone_id = "/hostedzone/Z1N5FTREX7LSX"
}

resource "aws_security_group" "api-elb-kops-test-local" {
  name        = "api-elb.kops-test.local"
  vpc_id      = "vpc-0e8d86765e844b177"
  description = "Security group for api ELB"

  tags = {
    KubernetesCluster                       = "kops-test.local"
    Name                                    = "api-elb.kops-test.local"
    "kubernetes.io/cluster/kops-test.local" = "owned"
  }
}

resource "aws_security_group" "bastion-elb-kops-test-local" {
  name        = "bastion-elb.kops-test.local"
  vpc_id      = "vpc-0e8d86765e844b177"
  description = "Security group for bastion ELB"

  tags = {
    KubernetesCluster                       = "kops-test.local"
    Name                                    = "bastion-elb.kops-test.local"
    "kubernetes.io/cluster/kops-test.local" = "owned"
  }
}

resource "aws_security_group" "bastion-kops-test-local" {
  name        = "bastion.kops-test.local"
  vpc_id      = "vpc-0e8d86765e844b177"
  description = "Security group for bastion"

  tags = {
    KubernetesCluster                       = "kops-test.local"
    Name                                    = "bastion.kops-test.local"
    "kubernetes.io/cluster/kops-test.local" = "owned"
  }
}

resource "aws_security_group" "masters-kops-test-local" {
  name        = "masters.kops-test.local"
  vpc_id      = "vpc-0e8d86765e844b177"
  description = "Security group for masters"

  tags = {
    KubernetesCluster                       = "kops-test.local"
    Name                                    = "masters.kops-test.local"
    "kubernetes.io/cluster/kops-test.local" = "owned"
  }
}

resource "aws_security_group" "nodes-kops-test-local" {
  name        = "nodes.kops-test.local"
  vpc_id      = "vpc-0e8d86765e844b177"
  description = "Security group for nodes"

  tags = {
    KubernetesCluster                       = "kops-test.local"
    Name                                    = "nodes.kops-test.local"
    "kubernetes.io/cluster/kops-test.local" = "owned"
  }
}

resource "aws_security_group_rule" "all-master-to-master" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-kops-test-local.id}"
  source_security_group_id = "${aws_security_group.masters-kops-test-local.id}"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
}

resource "aws_security_group_rule" "all-master-to-node" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.nodes-kops-test-local.id}"
  source_security_group_id = "${aws_security_group.masters-kops-test-local.id}"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
}

resource "aws_security_group_rule" "all-node-to-node" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.nodes-kops-test-local.id}"
  source_security_group_id = "${aws_security_group.nodes-kops-test-local.id}"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
}

resource "aws_security_group_rule" "api-elb-egress" {
  type              = "egress"
  security_group_id = "${aws_security_group.api-elb-kops-test-local.id}"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "bastion-egress" {
  type              = "egress"
  security_group_id = "${aws_security_group.bastion-kops-test-local.id}"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "bastion-elb-egress" {
  type              = "egress"
  security_group_id = "${aws_security_group.bastion-elb-kops-test-local.id}"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "bastion-to-master-ssh" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-kops-test-local.id}"
  source_security_group_id = "${aws_security_group.bastion-kops-test-local.id}"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "bastion-to-node-ssh" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.nodes-kops-test-local.id}"
  source_security_group_id = "${aws_security_group.bastion-kops-test-local.id}"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "https-api-elb-0-0-0-0--0" {
  type              = "ingress"
  security_group_id = "${aws_security_group.api-elb-kops-test-local.id}"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "https-elb-to-master" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-kops-test-local.id}"
  source_security_group_id = "${aws_security_group.api-elb-kops-test-local.id}"
  from_port                = 443
  to_port                  = 443
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "master-egress" {
  type              = "egress"
  security_group_id = "${aws_security_group.masters-kops-test-local.id}"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "node-egress" {
  type              = "egress"
  security_group_id = "${aws_security_group.nodes-kops-test-local.id}"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "node-to-master-protocol-ipip" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-kops-test-local.id}"
  source_security_group_id = "${aws_security_group.nodes-kops-test-local.id}"
  from_port                = 0
  to_port                  = 65535
  protocol                 = "4"
}

resource "aws_security_group_rule" "node-to-master-tcp-1-2379" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-kops-test-local.id}"
  source_security_group_id = "${aws_security_group.nodes-kops-test-local.id}"
  from_port                = 1
  to_port                  = 2379
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "node-to-master-tcp-2382-4001" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-kops-test-local.id}"
  source_security_group_id = "${aws_security_group.nodes-kops-test-local.id}"
  from_port                = 2382
  to_port                  = 4001
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "node-to-master-tcp-4003-65535" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-kops-test-local.id}"
  source_security_group_id = "${aws_security_group.nodes-kops-test-local.id}"
  from_port                = 4003
  to_port                  = 65535
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "node-to-master-udp-1-65535" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-kops-test-local.id}"
  source_security_group_id = "${aws_security_group.nodes-kops-test-local.id}"
  from_port                = 1
  to_port                  = 65535
  protocol                 = "udp"
}

resource "aws_security_group_rule" "ssh-elb-to-bastion" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.bastion-kops-test-local.id}"
  source_security_group_id = "${aws_security_group.bastion-elb-kops-test-local.id}"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "ssh-external-to-bastion-elb-0-0-0-0--0" {
  type              = "ingress"
  security_group_id = "${aws_security_group.bastion-elb-kops-test-local.id}"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

terraform = {
  required_version = ">= 0.9.3"
}
