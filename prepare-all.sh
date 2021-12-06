#!/bin/sh

mkdir ./bin
mkdir ./images
mkdir ./okd-ignition
mkdir ./secrets
mkdir ./temp

./scripts/install-prerequisites.sh
./scripts/download-bin.sh
./scripts/generate-ssh-key.sh
./scripts/generate-fcos-image.sh
./scripts/template-configs.sh
./scripts/generate-okd-ignition.sh

cd ./terraform
terraform init
cd ..