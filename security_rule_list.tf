resource "oci_core_security_list" "public_vcn_security_list" {

  display_name = "Public Security List"
  egress_security_rules {
    #Required
    destination = var.public_internet
    protocol = var.all

    #Optional
    destination_type = "CIDR_BLOCK"
    stateless = false
    description = "Egress traffic to the public internet"

  }

  ingress_security_rules {
    # Required
    protocol = var.tcp
    source = var.public_internet

    # Optional
    source_type = "CIDR_BLOCK"
    stateless = false
    tcp_options {
      # Optional
      max = var.ssh
      min = var.ssh
    }

    description = "Allow SSH traffic"
  }

    ingress_security_rules {
    # Required
    protocol = var.tcp
    source = var.public_internet

    # Optional
    source_type = "CIDR_BLOCK"
    stateless = false
    tcp_options {
      # Optional
      max = var.grafana
      min = var.grafana
    }

    description = "Access Grafana Dashboard"
  }

  ingress_security_rules {
    # Required
    source = var.public_internet
    protocol = 1

    # Optional
    source_type = "CIDR_BLOCK"
    stateless = false

    description = "Ingress ICMP traffic from public"
  }


  compartment_id = oci_identity_compartment.montoring_compartment.compartment_id
  vcn_id = oci_core_vcn.monitoring_vcn.id
}

resource "oci_core_security_list" "private_subnet_security_list" {
  #Required
  compartment_id = oci_identity_compartment.montoring_compartment.compartment_id
  vcn_id = oci_core_vcn.monitoring_vcn.id
  display_name = "Private Security List"


  egress_security_rules {
    #Required
    destination = var.public_internet
    protocol = var.all

    #Optional
    description = "Allow all traffic"
  }

  ingress_security_rules {
    protocol = var.all
    source = oci_core_vcn.monitoring_vcn.cidr_block

    #Optional
    description = "Allow all traffic from VCN Network"
  }
}