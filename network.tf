### Create VDS
resource "vsphere_distributed_virtual_switch" "dvs" {
  name          = "tf-tkg"
  datacenter_id = data.vsphere_datacenter.dc.id

  uplinks         = ["uplink1", "uplink2"]
  active_uplinks  = ["uplink1"]
  standby_uplinks = ["uplink2"]
  max_mtu         = "1600"
  host {
    host_system_id = data.vsphere_host.tkg_shuttle.0.id
    devices        = ["vmnic0"]
  }
  host {
    host_system_id = data.vsphere_host.tkg_shuttle.1.id
    devices        = ["vmnic0"]
  }
  host {
    host_system_id = data.vsphere_host.hosts.0.id
    devices        = var.network_interfaces
  }
  host {
    host_system_id = data.vsphere_host.hosts.1.id
    devices        = var.network_interfaces
  }
  host {
    host_system_id = data.vsphere_host.hosts.2.id
    devices        = var.network_interfaces
  }
}

resource "vsphere_distributed_port_group" "pg-1" {
  name                            = "tf-edge-tunnel"
  distributed_virtual_switch_uuid = vsphere_distributed_virtual_switch.dvs.id

  vlan_id = 82
}

resource "vsphere_distributed_port_group" "pg-2" {
  name                            = "tf-edge-uplink"
  distributed_virtual_switch_uuid = vsphere_distributed_virtual_switch.dvs.id

  vlan_id = 71
}


resource "vsphere_distributed_port_group" "pg-3" {
  name                            = "tf-tkg-mgmt"
  distributed_virtual_switch_uuid = vsphere_distributed_virtual_switch.dvs.id
  type = "ephemeral"
  auto_expand = false
  number_of_ports = 200
  vlan_id = 64
  lifecycle {
    ignore_changes = [
      number_of_ports,
    ]
  }
}

resource "vsphere_distributed_port_group" "pg-4" {
  name                            = "tf-esx-mgmt"
  distributed_virtual_switch_uuid = vsphere_distributed_virtual_switch.dvs.id
  
  vlan_id = 0
}

resource "vsphere_distributed_virtual_switch" "dvs-mgmt" {
  name          = "tf-mgmt"
  datacenter_id = data.vsphere_datacenter.dc.id
  version         = "6.5.0"
  uplinks         = ["uplink1", "uplink2"]
  active_uplinks  = ["uplink1"]
  standby_uplinks = ["uplink2"]
  max_mtu         = "1600"

  host {
    host_system_id = data.vsphere_host.tkg_mgmt.0.id
    devices        = ["vmnic0", "vmnic1"]
  }
  host {
    host_system_id = data.vsphere_host.tkg_mgmt.1.id
    devices        = ["vmnic0", "vmnic1"]
  }
  host {
    host_system_id = data.vsphere_host.tkg_mgmt.2.id
    devices        = ["vmnic0", "vmnic1"]
  }
}

resource "vsphere_distributed_port_group" "tkg-mgmt-pg-1" {
  name                            = "tf-vlab-mgmt"
  distributed_virtual_switch_uuid = vsphere_distributed_virtual_switch.dvs-mgmt.id
  type = "ephemeral"
  auto_expand = false
  number_of_ports = 200
  vlan_id = 64
  lifecycle {
    ignore_changes = [
      number_of_ports,
    ]
  }
}

resource "vsphere_distributed_port_group" "tkg-mgmt-pg-2" {
  name                            = "tf-vlab-esxi"
  distributed_virtual_switch_uuid = vsphere_distributed_virtual_switch.dvs-mgmt.id

  vlan_id = 79
}

resource "vsphere_distributed_port_group" "tkg-mgmt-pg-3" {
  name                            = "tf-vlab-dmz"
  distributed_virtual_switch_uuid = vsphere_distributed_virtual_switch.dvs-mgmt.id

  vlan_id = 69
}