output "GrafanaServerPublicIP" {
  value = oci_core_instance.grafana_server_instance.public_ip
}