## vSphere Information
vsphere_provider_params = {
    vsphere_user       = "administrator@vsphere.local"
    vsphere_password   = "VMware1!"
    vsphere_server     = "vlab-vcsa.vballin.com"
}

## Data Collection
datacenter  = "vlab-dc"

## Resources Vars
qnap_nas = "192.168.79.10"
datastore_1 = "vlab-nfs-ds-01"
datastore_2 = "vlab-nfs-ds-02"
datastore_4 = "vlab-nfs-ds-04"
tag_category = "workload-mgmt"
datastore_1_path = "/NFS-DS-01"
datastore_2_path = "/NFS-DS-02"
datastore_4_path = "/NFS-DS-04"
tag = "workload-mgmt-storage"