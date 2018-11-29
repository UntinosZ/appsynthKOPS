#!/bin/sh

cd dist
terraform destroy -auto-approve

cd ../

set -xe
export NAME=$(terraform output cluster_name).local
export KOPS_STATE_STORE=$(terraform output state_store)
export ZONES=$(terraform output -json availability_zones | jq -r '.value|join(",")')
export MASTERZONE='ap-southeast-1b'
export SSH_PUBKEY=$(terraform output public_key)
export PUBLIC_SUBNET=$(terraform output publicsubnets)
export PRIVATE_SUBNET=$(terraform output privatesubnets)
export NETWORK_CIDR=$(terraform output vpc_cidr)
export VPC_ID=$(terraform output vpc_id)
export ZONE_ID=$(terraform output private_zone_id)

kops delete cluster $NAME --yes

terraform destroy -auto-approve