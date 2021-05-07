resource "oci_core_instance" "prometheus_server_instance" {
  display_name = "Prometheus Server"
  availability_domain = lookup(data.oci_identity_availability_domains.availability_domains.availability_domains[0], "name")
  compartment_id = oci_identity_compartment.montoring_compartment.id
  shape = var.instance_shape

  create_vnic_details {
    assign_public_ip = false
    subnet_id = oci_core_subnet.monitoring_private_subnet.id
    display_name = "Prometheus Server VNIC"
    skip_source_dest_check = false
  }

  source_details {
    source_type = "image"
    source_id = data.oci_core_images.ol_images.images[0].id
  }
  metadata = {
    ssh_authorized_keys = var.node_pool_ssh_public_key
    user_data = base64encode(data.template_file.prometheus_user_data.rendered)
  }

  timeouts {
    create = "60m"
  }
}