## vSphere Data Collection
data "vsphere_datacenter" "dc" {
  name = var.datacenter
}

data "vsphere_host" "all-hosts" {
  count         = length(var.all-hosts)
  name          = var.all-hosts[count.index]
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_host" "hosts" {
  count         = length(var.hosts)
  name          = var.hosts[count.index]
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_host" "tkg_shuttle" {
  count         = length(var.tkg-hosts)
  name          = var.tkg-hosts[count.index]
  datacenter_id = data.vsphere_datacenter.dc.id
}