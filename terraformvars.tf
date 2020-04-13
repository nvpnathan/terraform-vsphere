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
    "vlab-esx-100.vballin.com",
    "vlab-esx-110.vballin.com",
    "vlab-esx-120.vballin.com",
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

variable "tkg-mgmt-hosts" {
  type = list(string)
  default = [
    "vlab-esx-100.vballin.com",
    "vlab-esx-110.vballin.com",
    "vlab-esx-120.vballin.com",
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

variable "qnap_nas" {
  type        = string
  description = "QNAP IP for datastores"
}

variable "datastore_1" {
  type        = string
  description = "datastores"
}

variable "datastore_2" {
  type        = string
  description = "datastores"
}

variable "datastore_4" {
  type        = string
  description = "datastores"
}

variable "datastore_1_path" {
  type        = string
  description = "NAS NFS Path"
}

variable "datastore_2_path" {
  type        = string
  description = "NAS NFS Path"
}

variable "datastore_4_path" {
  type        = string
  description = "NAS NFS Path"
}

variable "vm_folder" {
  type        = string
  description = "vm folder for packer"
}

variable "vm_folder_tf" {
  type        = string
  description = "vm folder for terraform"
}

variable "vm_folder_tkg" {
  type        = string
  description = "vm folder for terraform"
}

variable "mgmt_rp" {
  type        = string
  description = "resource pool for tkg mgmt"
}

variable "comp_rp" {
  type        = string
  description = "resource pool for tkg workloads"
}

variable "mgmt_net" {
  type        = string
  description = "tkg mgmt vlan"
}

variable "mgmt_net_vlan" {
  type        = string
  description = "tkg mgmt vlan"
}