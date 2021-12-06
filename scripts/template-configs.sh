#!/bin/sh
echo "Reading data from okd-config.ini..."
yc_token=$(awk -r -F  "=" '/yc_token/ {print $2}' ./okd-config.ini | tr -d '\r')
yc_cloud_id=$(awk -F "=" '/yc_cloud_id/ {print $2}' ./okd-config.ini | tr -d '\r')
yc_folder_id=$(awk -F "=" '/yc_folder_id/ {print $2}' ./okd-config.ini | tr -d '\r')
dns_zone=$(awk -F "=" '/dns_zone/ {print $2}' ./okd-config.ini | tr -d '\r')
cluster_name=$(awk -F "=" '/cluster_name/ {print $2}' ./okd-config.ini | tr -d '\r')
master_count=$(awk -F "=" '/master_count/ {print $2}' ./okd-config.ini | tr -d '\r')
worker_count=$(awk -F "=" '/worker_count/ {print $2}' ./okd-config.ini | tr -d '\r')
boostrap_count=$(awk -F "=" '/boostrap_count/ {print $2}' ./okd-config.ini | tr -d '\r')
sshKey=$(cat ./secrets/id_rsa.pub)

echo "Templating configs..."
sed -i '/token     = "/c\    token     = "'"$yc_token"'"' ./terraform/main.tf
sed -i '/cloud_id  = "/c\    cloud_id  = "'"$yc_cloud_id"'"' ./terraform/main.tf
sed -i '/folder_id = "/c\    folder_id = "'"$yc_folder_id"'"' ./terraform/main.tf

sed -i '/dns_zone_name = "/c\dns_zone_name = "'"$dns_zone".'"' ./terraform/terraform.tfvars
sed -i '/cluster_name  = "/c\cluster_name  = "'"$cluster_name"'"' ./terraform/terraform.tfvars
sed -i '/master_count ="/c\master_count = '"$master_count"'' ./terraform/terraform.tfvars
sed -i '/worker_count ="/c\worker_count = '"$worker_count"'' ./terraform/terraform.tfvars

sed -i '/baseDomain: "/c\baseDomain: '"$dns_zone"'' ./okd-config/install-config.yaml
sed -i '/sshKey: /c\sshKey: '"$sshKey"'' ./okd-config/install-config.yaml

sed -i '/ssh-rsa/c\                    "'"$sshKey"'"' ./custom-ignition/bastion.ign