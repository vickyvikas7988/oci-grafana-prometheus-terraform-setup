data "oci_core_images" "ol_images" {
  compartment_id           = oci_identity_compartment.montoring_compartment.compartment_id
  operating_system         = "Oracle Linux"
  operating_system_version = "7.9"
  state                    = "AVAILABLE"
  sort_by                  = "TIMECREATED"
  sort_order               = "DESC"
  shape                    = var.instance_shape

}

data "oci_identity_availability_domains" "availability_domains" {
  # Required
  compartment_id = oci_identity_compartment.montoring_compartment.compartment_id
}

data "template_file" "prometheus_user_data" {
  template = file("${path.module}/scripts/prometheus_userdata.yaml")
}

data "template_file" "grafana_user_data" {
  template = file("${path.module}/scripts/grafana_userdata.yaml")
}