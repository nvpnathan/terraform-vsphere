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
  #host_system_ids = data.vsphere_host.tkg_shuttle.*.id

  drs_enabled          = true
  drs_automation_level = "fullyAutomated"

  ha_enabled = true
  ha_admission_control_policy = "disabled"
  ha_advanced_options = {
    "das.IgnoreInsufficientHbDatastore" = true
    "das.IgnoreRedundantNetWarning" = true
  }
}