resource "oci_core_nat_gateway" "monitoring_nat_gateway" {
    #Required
    compartment_id = oci_identity_compartment.montoring_compartment.compartment_id
    vcn_id = oci_core_vcn.monitoring_vcn.id

    #Optional
    display_name = "Monitoring NAT Gateway"
}
