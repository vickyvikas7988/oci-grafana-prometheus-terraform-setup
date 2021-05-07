resource "oci_identity_compartment" "montoring_compartment" {
  compartment_id = var.tenancy_ocid
  description    = "Monitoring compartment"
  name           = "Monitoring"
}