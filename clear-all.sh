#!/bin/sh
echo "Cleaning all to default state..."
rm -r ./bin/*
rm -r ./images/*
rm -r ./okd-ignition/*
rm -r ./secrets/*
rm -r ./temp/*
rm -r ./terraform/.terraform
rm ./terraform/.terraform.lock.hcl
rm ./terraform/terraform.tfstate
rm ./terraform/terraform.tfstate.backup
