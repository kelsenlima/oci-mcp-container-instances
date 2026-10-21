terraform {
  required_version = ">= 1.0.0"
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = ">= 4.0.0"
    }
  }
}

provider "oci" {
  tenancy_ocid = var.tenancy_ocid
  region       = var.region
}

# 1. Obter VCN e Subnet padrão do compartimento
data "oci_core_subnets" "existing_subnets" {
  compartment_id = var.compartment_ocid
}

# 2. OCI Container Instance para Hospedagem dos Servidores MCP
resource "oci_container_instances_container_instance" "mcp_container_instance" {
  compartment_id      = var.compartment_ocid
  display_name        = "mcp-servers-host"
  availability_domain = var.availability_domain
  shape               = "CI.Standard.E4.Flex"

  shape_config {
    ocpus         = var.container_instance_ocpus
    memory_in_gbs = var.container_instance_memory_in_gbs
  }

  vnics {
    subnet_id = data.oci_core_subnets.existing_subnets.subnets[0].id
    is_public_ip_assigned = true
  }

  containers {
    display_name = "mcp-server-core"
    image_url    = "iad.ocir.io/oracle/mcp-server-base:latest"
  }
}