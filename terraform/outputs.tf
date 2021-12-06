
output "ocp_public_ip" {
  description = "IP address to connect to OpenShift cluster API externally"
  value       = "IP address to connect to OpenShift cluster API externally ${yandex_vpc_address.addr_api.external_ipv4_address[0].address}"
}
