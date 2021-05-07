resource "oci_core_vcn" "monitoring_vcn" {
  cidr_block     = "172.16.0.0/16"
  compartment_id = var.tenancy_ocid
  display_name = "Monitoring VCN"
}

