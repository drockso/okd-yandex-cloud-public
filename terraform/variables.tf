#Networking
variable "network_name" {
  description = "Name to be used on all network resources as identifier"
  default     = "okd_network"
  type        = string
}

variable "network_description" {
  description = "An optional description of this resource. Provide this property when you create the resource."
  type        = string
  default     = "OKD Container Platform Network"
}
#variable "image_id" {
#  type        = string
#  description = "RHcos image-id manually uplouded to Yandex.Cloud account"
#}
variable "folder_id" {
  type        = string
  default     = null
  description = "Folder-ID where the resources will be created"
}

variable "subnets" {
  description = "Describe your subnets preferences"
  type = list(object({
    zone           = string
    v4_cidr_blocks = string
  }))
  default = [
    {
      zone           = "ru-central1-a"
      v4_cidr_blocks = "10.210.0.0/16"
    },
    {
      zone           = "ru-central1-b"
      v4_cidr_blocks = "10.220.0.0/16"
    },
    {
      zone           = "ru-central1-c"
      v4_cidr_blocks = "10.230.0.0/16"
    }
  ]
}
variable "pod_subnet" {
  type        = string
  default     = "10.128.0.0/16"
  description = "CIDR for pods in okd cluster "
}

variable "service_subnet" {
  type        = string
  default     = "172.30.0.0/16"
  description = "CIDR for services in okd cluster"
}
#DNS
variable "dns_zone_name" {
  type        = string
  default     = "okd-cluster."
  description = "Base domain name"
}

variable "cluster_name" {
  type        = string
  default     = "demo"
  description = "okd cluster name, aka dns level 3 domain name"
}

#Labels
variable "labels" {
  description = "A set of key/value label pairs to assign."
  type        = map(string)
  default     = null
}
#master resources
variable "master_count" {
  type        = number
  default     = 3
  description = "Number of master nodes"
}
variable "master_cpu" {
  type        = number
  default     = 4
  description = "Number of vCPU for master nodes"
}
variable "master_ram" {
  type        = number
  default     = 16
  description = "Number of vRAM for master nodes"
}

#worker resources
variable "worker_count" {
  type        = number
  default     = 2
  description = "Number of worker nodes"
}
variable "worker_cpu" {
  type        = number
  default     = 4
  description = "Number of vCPU for worker nodes"
}
variable "worker_ram" {
  type        = number
  default     = 16
  description = "Number of vRAM for worker nodes"
}

variable "bootstrap_count" {
  type        = number
  default     = 1
  description = "Number of bootstrap nodes"
}