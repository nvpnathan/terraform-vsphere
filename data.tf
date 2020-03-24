## vSphere Data Collection
data "vsphere_datacenter" "dc" {
  name = var.datacenter
}

data "vsphere_host" "hosts" {
  count         = length(var.hosts)
  name          = var.hosts[count.index]
  datacenter_id = data.vsphere_datacenter.dc.id
}
