# provider variables
variable "vsphere_provider_params" {
  default = {
    vsphere_user       = "administrator@vsphere.local"
    vsphere_password   = "VMware1!"
    vsphere_server     = "vlab-vcsa.vballin.com"
  }
}

variable "datacenter" {
  type        = string
  description = "datacenter object in vcenter"
}

variable "all-hosts" {
  type = list(string)
  default = [
    "vlab-esx-80.vballin.com",
    "vlab-esx-90.vballin.com",
    "vlab-esx-130.vballin.com",
    "vlab-esx-140.vballin.com",
    "vlab-esx-150.vballin.com",
  ]
}

variable "hosts" {
  type = list(string)
  default = [
    "vlab-esx-130.vballin.com",
    "vlab-esx-140.vballin.com",
    "vlab-esx-150.vballin.com",
  ]
}

variable "tkg-hosts" {
  type = list(string)
  default = [
    "vlab-esx-80.vballin.com",
    "vlab-esx-90.vballin.com",
  ]
}

variable "network_interfaces" {
  default = [
    "vmnic1",
  ]
}

variable "tag" {
  type        = string
  description = "tag"
}

variable "tag_category" {
  type        = string
  description = "tag category"
}