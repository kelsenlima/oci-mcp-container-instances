variable "tenancy_ocid" {
  type        = string
  description = "OCID da Tenancy OCI / Tenancy OCID"
}

variable "compartment_ocid" {
  type        = string
  description = "OCID do Compartimento / Compartment OCID"
}

variable "region" {
  type        = string
  default     = "sa-saopaulo-1"
  description = "Região OCI / OCI Region"
}

variable "availability_domain" {
  type        = string
  description = "Domain de Disponibilidade (AD) da OCI"
}

variable "ocir_mcp_registry_prefix" {
  type        = string
  default     = "iad.ocir.io/oracle/mcp-servers"
  description = "URL do registro OCIR contendo as imagens dos servidores MCP"
}