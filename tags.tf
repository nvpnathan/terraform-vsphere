resource "vsphere_tag_category" "category" {
  name        = var.tag_category
  cardinality = "SINGLE"
  description = "Managed by Terraform"

  associable_types = [
    "Datastore",
  ]
}

resource "vsphere_tag" "tag" {
  name        = var.tag
  category_id = vsphere_tag_category.category.id
  description = "Managed by Terraform"
}