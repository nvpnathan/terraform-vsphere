resource "vsphere_nas_datastore" "datastore-1" {
  name            = "vlab-nfs-ds-01"
  host_system_ids = data.vsphere_host.hosts.*.id

  type         = "NFS"
  remote_hosts = ["192.168.79.10"]
  remote_path  = "/NFS-DS-01"
}

resource "vsphere_nas_datastore" "datastore-2" {
  name            = "vlab-nfs-ds-02"
  host_system_ids = data.vsphere_host.hosts.*.id

  type         = "NFS"
  remote_hosts = ["192.168.79.10"]
  remote_path  = "/NFS-DS-02"
}