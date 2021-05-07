resource "oci_core_instance" "grafana_server_instance" {
  display_name = "Grafana Server"
  availability_domain = lookup(data.oci_identity_availability_domains.availability_domains.availability_domains[0], "name")
  compartment_id = oci_identity_compartment.montoring_compartment.id
  shape = "VM.Standard2.1"

  create_vnic_details {
    assign_public_ip = true
    subnet_id = oci_core_subnet.monitoring_private_subnet.id
    display_name = "Grafana Server VNIC"
    skip_source_dest_check = false
  }

  source_details {
    source_type = "image"
    source_id = data.oci_core_images.ol_images.images[0].id
  }
  metadata = {
    ssh_authorized_keys = var.node_pool_ssh_public_key
    user_data = base64encode(data.template_file.grafana_user_data.rendered)
  }

  timeouts {
    create = "60m"
  }
}