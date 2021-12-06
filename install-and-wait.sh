#!/bin/sh
RED='\033[0;31m'

echo "Running Terraform apply (it will take a long first time due to large image upload)..."
cd ./terraform
terraform apply -auto-approve
cd ..

echo "${RED}NOW ALLOW INTERNET-NAT FOR ALL NEW SUBNETS IN NAMESPACE"
echo "${RED}NOW ALLOW INTERNET-NAT FOR ALL NEW SUBNETS IN NAMESPACE"
echo "${RED}NOW ALLOW INTERNET-NAT FOR ALL NEW SUBNETS IN NAMESPACE"
echo "${RED}NOW ALLOW INTERNET-NAT FOR ALL NEW SUBNETS IN NAMESPACE"
echo "${RED}NOW ALLOW INTERNET-NAT FOR ALL NEW SUBNETS IN NAMESPACE"
echo "${RED}NOW ALLOW INTERNET-NAT FOR ALL NEW SUBNETS IN NAMESPACE"
echo "${RED}NOW ALLOW INTERNET-NAT FOR ALL NEW SUBNETS IN NAMESPACE"

echo "Now waiting OKD to complete install on servers (will take an hour)..."
echo "${RED}UPDATE DNS IF NEEDED"
./scripts/wait-for-bootstrap.sh
echo "Bootstrap completed!"

echo "Removing bootstrap node..."
sed -i '/bootstrap_count = 1/c\bootstrap_count = 0' ./terraform/terraform.tfvars
cd ./terraform
terraform apply -auto-approve
cd ..


echo "Sleeping 20 mins to get workers up..."
sleep 20m

echo "Signing worker nodes csrs..."
./scripts/sign-csr-all.sh

echo "Sleeping 5 mins..."
sleep 5m

echo "Signing worker nodes csrs again..."
./scripts/sign-csr-all.sh

echo "Wait finally to install..."
./scripts/wait-for-install.sh

