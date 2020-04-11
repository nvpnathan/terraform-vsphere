resource "vsphere_nas_datastore" "datastore-1" {
  name            = var.datastore_1
  host_system_ids = data.vsphere_host.all-hosts.*.id

  type         = "NFS"
  remote_hosts = [var.qnap_nas]
  remote_path  = var.datastore_1_path
}

resource "vsphere_nas_datastore" "datastore-2" {
  name            = var.datastore_2
  host_system_ids = data.vsphere_host.all-hosts.*.id

  type         = "NFS"
  remote_hosts = [var.qnap_nas]
  remote_path  = var.datastore_2_path
}

resource "vsphere_nas_datastore" "datastore-4" {
  name            = var.datastore_4
  host_system_ids = data.vsphere_host.all-hosts.*.id

  type         = "NFS"
  remote_hosts = [var.qnap_nas]
  remote_path  =var.datastore_4_path
}