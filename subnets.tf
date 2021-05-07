resource "oci_core_subnet" "monitoring_public_subnet" {
  cidr_block     = "172.16.1.0/24"
  compartment_id = oci_identity_compartment.montoring_compartment.id
  vcn_id         = oci_core_vcn.monitoring_vcn.id
  display_name   = "Monitoring Public Subnet"
  route_table_id = oci_core_route_table.public_route_table.id
  security_list_ids = [oci_core_security_list.public_vcn_security_list.id]
}

resource "oci_core_subnet" "monitoring_private_subnet" {
  cidr_block     = "172.16.2.0/24"
  compartment_id = oci_identity_compartment.montoring_compartment.id
  vcn_id         = oci_core_vcn.monitoring_vcn.id
  display_name   = "Monitoring Private Subnet"
  route_table_id = oci_core_route_table.private_route_table.id
  security_list_ids = [oci_core_security_list.private_subnet_security_list.id]
  prohibit_public_ip_on_vnic = true
}