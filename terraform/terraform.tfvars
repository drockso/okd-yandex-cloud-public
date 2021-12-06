dns_zone_name = "test.ru."
cluster_name  = "okd-yc"
master_count = 3
master_cpu = 4
master_ram = 16
worker_count = 3
worker_cpu = 4
worker_ram = 16

bootstrap_count = 1

###
labels = {
  tag        = "okd",
  demo       = "false",
  created_by = "zyfra-okd-upi"
}
network_name = "okd_network"

subnets = [
  {
    zone           = "ru-central1-a"
    v4_cidr_blocks = "10.88.1.0/24"
  },
  {
    zone           = "ru-central1-b"
    v4_cidr_blocks = "10.88.2.0/24"
  },
  {
    zone           = "ru-central1-c"
    v4_cidr_blocks = "10.88.3.0/24"
  }
]