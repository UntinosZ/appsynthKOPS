#!/bin/sh

terraform init
terraform apply -auto-approve
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
kops create cluster \
    --master-zones $MASTERZONE \
    --zones $ZONES \
    --master-size t2.small \
    --node-size t2.micro \
    --node-count 3 \
    --topology private \
    --network-cidr $NETWORK_CIDR \
    --subnets $PRIVATE_SUBNET \
    --utility-subnets $PUBLIC_SUBNET \
    --dns-zone $ZONE_ID \
    --dns private \
    --networking calico \
    --vpc $VPC_ID \
    --bastion \
    --target=terraform \
    --ssh-public-key $SSH_PUBKEY \
    --out=./dist/ \
    ${NAME}

cd dist
terraform init
terraform plan
terraform apply --auto-approve