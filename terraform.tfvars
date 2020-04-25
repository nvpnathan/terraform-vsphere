## vSphere Information
vsphere_provider_params = {
    vsphere_user       = "administrator@vsphere.local"
    vsphere_password   = "VMware1!"
    vsphere_server     = "vlab-vcsa.vballin.com"
}

## Data Collection
datacenter  = "vlab-dc"

## Resources Vars
mgmt_rp = "tf-tkg-mgmt"
comp_rp = "tf-tkg-workload"
tf_vm_rp = "tf-terraform-vms"
qnap_nas = "192.168.79.10"
datastore_1 = "vlab-nfs-ds-01"
datastore_2 = "vlab-nfs-ds-02"
datastore_4 = "vlab-nfs-ds-04"
vm_folder   = "packer-templates"
vm_folder_tf = "terraform-vms"
vm_folder_tkg = "tf-tkg-vms"
tag_category = "workload-mgmt"
datastore_1_path = "/NFS-DS-01"
datastore_2_path = "/NFS-DS-02"
datastore_4_path = "/NFS-DS-04"
mgmt_net_vlan = "72"
mgmt_net = "tf-tkg-k8s-mgmt"
tag = "workload-mgmt-storage"