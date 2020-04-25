## vSphere Cluster

resource "vsphere_compute_cluster" "compute_cluster" {
  name            = "tf-vlab-workload"
  datacenter_id   = data.vsphere_datacenter.dc.id
  host_system_ids = data.vsphere_host.hosts.*.id

  drs_enabled          = true
  drs_automation_level = "fullyAutomated"

  ha_enabled = true
  ha_admission_control_policy = "disabled"
  ha_advanced_options = {
    "das.IgnoreInsufficientHbDatastore" = true
    "das.IgnoreRedundantNetWarning" = true
  }
}

resource "vsphere_compute_cluster" "tkg_cluster" {
  name            = "tf-vlab-tkg"
  datacenter_id   = data.vsphere_datacenter.dc.id
  host_system_ids = data.vsphere_host.tkg_shuttle.*.id

  drs_enabled          = true
  drs_automation_level = "fullyAutomated"

  ha_enabled = true
  ha_admission_control_policy = "disabled"
  ha_advanced_options = {
    "das.IgnoreInsufficientHbDatastore" = true
    "das.IgnoreRedundantNetWarning" = true
  }
}

resource "vsphere_compute_cluster" "tkg_mgmt" {
  name            = "tf-vlab-mgmt"
  datacenter_id   = data.vsphere_datacenter.dc.id
  host_system_ids = data.vsphere_host.tkg_mgmt.*.id

  drs_enabled          = true
  drs_automation_level = "fullyAutomated"

  ha_enabled = true
  ha_admission_control_policy = "disabled"
  ha_advanced_options = {
    "das.IgnoreInsufficientHbDatastore" = true
    "das.IgnoreRedundantNetWarning" = true
  }
}

resource "vsphere_resource_pool" "resource_pool-1" {
  name                    = var.mgmt_rp
  parent_resource_pool_id = vsphere_compute_cluster.tkg_mgmt.resource_pool_id
}

resource "vsphere_resource_pool" "resource_pool-2" {
  name                    = var.comp_rp
  parent_resource_pool_id = vsphere_compute_cluster.tkg_cluster.resource_pool_id
}

resource "vsphere_resource_pool" "resource_pool-3" {
  name                    = var.tf_vm_rp
  parent_resource_pool_id = vsphere_compute_cluster.tkg_mgmt.resource_pool_id
}

resource "vsphere_folder" "folder_tkg" {
  path          = var.vm_folder_tkg
  type          = "vm"
  datacenter_id = data.vsphere_datacenter.dc.id
}

resource "vsphere_host" "tkg-mgmt-host-01" {
  hostname = "vlab-esx-100.vballin.com"
  username = "root"
  password = "VMware1!"
  thumbprint = "9C:F4:EF:FB:DB:D2:29:4C:D3:CB:55:FB:31:6E:E4:0A:15:F4:A0:43"
  force = true
  cluster = vsphere_compute_cluster.tkg_mgmt.id
}

resource "vsphere_host" "tkg-mgmt-host-02" {
  hostname = "vlab-esx-110.vballin.com"
  username = "root"
  password = "VMware1!"
  thumbprint = "2F:1F:20:63:A8:60:E0:EA:5E:EC:6A:29:3A:B4:07:4E:33:D3:A8:3C"
  force = true
  cluster = vsphere_compute_cluster.tkg_mgmt.id
}

resource "vsphere_host" "tkg-mgmt-host-03" {
  hostname = "vlab-esx-120.vballin.com"
  username = "root"
  password = "VMware1!"
  thumbprint = "7C:14:03:AD:B3:46:AC:DC:FF:9A:8A:DF:5D:B9:69:5F:C0:F3:0D:6E"
  force = true
  cluster = vsphere_compute_cluster.tkg_mgmt.id
}

resource "vsphere_folder" "folder" {
  path          = var.vm_folder
  type          = "vm"
  datacenter_id = data.vsphere_datacenter.dc.id
}

resource "vsphere_folder" "tf-folder" {
  path          = var.vm_folder_tf
  type          = "vm"
  datacenter_id = data.vsphere_datacenter.dc.id
}