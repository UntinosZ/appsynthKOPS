# Appsynth KOPS Test

Hi! I'm Nopparid Mokpradab. I got some test from Appsynth for work in DevOps position.

## Installation
- [kops](https://github.com/kubernetes/kops/blob/master/docs/install.md)
- [terraform](https://www.terraform.io/intro/getting-started/install.html)
- [awscli](https://docs.aws.amazon.com/cli/latest/userguide/installing.html)

## Prepare
generate ssh public key from private key

    ssh-keygen -f aws_keyname.pem -y

## Set Variables
Please open file **kops/vars.tf** for change variables
| Name | Default | Description |
|-- |--| --|
|vpc_cidr | 10.0.22.0 | VPC CIDR (Should not same as other in your account) |
|key_name | | SSH Key name to use for access to ec2 instance |
|s3_bucket_name | | Default s3 bucket|
|app_domain | dev.tftest.local | Domain name |
|zone_domain | tftest.local | Zone Domain name |
|database_name|kops_test| Database name|
|database_username|kops_user| Database username|
|database_password|password| Database password|
|public_key|| Public key path after generate from private key|

## Start KOPS
1. Please run `aws configure` for config your AWS Credentials.
2. `./kops_create.sh`

When you finish check and need to remove all of terraform resource please use command `./kops_destroy.sh`