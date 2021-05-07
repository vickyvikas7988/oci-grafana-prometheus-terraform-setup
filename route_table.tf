resource "oci_core_route_table" "public_route_table" {
  #Required
  compartment_id = oci_identity_compartment.montoring_compartment.compartment_id
  vcn_id = oci_core_vcn.monitoring_vcn.id

  #Optional
  display_name = "Public Route Table"
  route_rules {
    #Required
    network_entity_id = oci_core_internet_gateway.monitoring_internet_gateway.id

    #Optional
    description = "Access to Public Internet"
    destination = var.public_internet
  }
}

resource "oci_core_route_table" "private_route_table" {
  #Required
  compartment_id = oci_identity_compartment.montoring_compartment.compartment_id
  vcn_id = oci_core_vcn.monitoring_vcn.id

  #Optional
  display_name = "Private Route Table"
  route_rules {
    #Required
    network_entity_id = oci_core_nat_gateway.monitoring_nat_gateway.id

    #Optional
    description = "Access to Public Subnet"
    destination = var.public_internet
  }
}
