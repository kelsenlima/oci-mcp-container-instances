output "api_gateway_endpoint_url" {
  value       = oci_apigateway_gateway.mcp_api_gateway.hostname
  description = "URL base do API Gateway HTTPS para conexão do AI Client"
}

output "container_instance_private_ip" {
  value       = oci_container_instances_container_instance.mcp_containers.vnics[0].private_ip
  description = "IP Privado da Container Instance com os servidores MCP"
}