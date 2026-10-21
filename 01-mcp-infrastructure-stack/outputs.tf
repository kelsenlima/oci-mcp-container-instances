output "container_instance_id" {
  value       = oci_container_instances_container_instance.mcp_container_instance.id
  description = "OCID da Container Instance criada para os servidores MCP"
}

output "container_instance_public_ip" {
  value       = oci_container_instances_container_instance.mcp_container_instance.vnics[0].public_ip
  description = "IP Público para conexão dos Clientes de IA ao servidor MCP"
}