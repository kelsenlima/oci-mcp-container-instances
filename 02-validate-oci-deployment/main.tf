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

# 1. Criação da VCN e Topologia de Rede
resource "oci_core_vcn" "mcp_vcn" {
  compartment_id = var.compartment_ocid
  cidr_blocks    = ["10.0.0.0/16"]
  display_name   = "mcp-vcn"
}

resource "oci_core_internet_gateway" "mcp_ig" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.mcp_vcn.id
  display_name   = "mcp-internet-gateway"
}

resource "oci_core_nat_gateway" "mcp_nat" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.mcp_vcn.id
  display_name   = "mcp-nat-gateway"
}

resource "oci_core_subnet" "public_subnet" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.mcp_vcn.id
  cidr_block     = "10.0.1.0/24"
  display_name   = "mcp-public-subnet"
}

resource "oci_core_subnet" "private_subnet" {
  compartment_id            = var.compartment_ocid
  vcn_id                    = oci_core_vcn.mcp_vcn.id
  cidr_block                = "10.0.2.0/24"
  display_name              = "mcp-private-subnet"
  prohibit_public_ip_on_vnic = true
}

# 2. OCI API Gateway (Ponto de Entrada HTTPS)
resource "oci_apigateway_gateway" "mcp_api_gateway" {
  compartment_id = var.compartment_ocid
  endpoint_type  = "PUBLIC"
  subnet_id      = oci_core_subnet.public_subnet.id
  display_name   = "mcp-api-gateway"
}

# 3. OCI Container Instance com os 3 Servidores MCP (Privada)
resource "oci_container_instances_container_instance" "mcp_containers" {
  compartment_id      = var.compartment_ocid
  display_name        = "mcp-servers-container-instance"
  availability_domain = var.availability_domain
  shape               = "CI.Standard.E4.Flex"

  shape_config {
    ocpus         = 2
    memory_in_gbs = 16
  }

  vnics {
    subnet_id                  = oci_core_subnet.private_subnet.id
    is_public_ip_assigned      = false
  }

  # Servidor MCP 1: Terraform
  containers {
    display_name = "terraform-mcp-server"
    image_url    = "${var.ocir_mcp_registry_prefix}/terraform:latest"
  }

  # Servidor MCP 2: GitHub
  containers {
    display_name = "github-mcp-server"
    image_url    = "${var.ocir_mcp_registry_prefix}/github:latest"
  }

  # Servidor MCP 3: Playwright
  containers {
    display_name = "playwright-mcp-server"
    image_url    = "${var.ocir_mcp_registry_prefix}/playwright:latest"
  }
}