# Módulo 02: Validação de Deploy OCI, API Gateway e Contêineres MCP
# Module 02: OCI Deployment Validation, API Gateway & MCP Containers

---

## 🇧🇷 Português (PT-BR)

### Visão Geral
Este módulo automatiza a topologia de rede completa e a camada de entrada do **API Gateway** necessária para expor com segurança os três servidores **Model Context Protocol (MCP)** em OCI Container Instances sem expor IPs públicos diretos.

### Recursos Provisionados via Terraform:
- **Rede VCN Completa:** VCN dedicada com Subnets Pública e Privada, Internet Gateway, NAT Gateway e Service Gateway.
- **OCI API Gateway:** Gateway HTTPS para roteamento e conexão segura dos clientes de IA aos endpoints MCP.
- **OCI Container Instance Privada:** Hospedagem dos 3 contêineres de servidores MCP (Terraform, GitHub e Playwright) conectados exclusivamente via API Gateway.

---

## 🇺🇸 English (EN)

### Overview
This module automates the full network topology and **API Gateway** ingress layer required to securely expose the three **Model Context Protocol (MCP)** servers on OCI Container Instances without direct public IP exposure.

### Provisioned Resources via Terraform:
- **Complete VCN Topology:** Dedicated VCN with Public/Private Subnets, Internet Gateway, NAT Gateway, and Service Gateway.
- **OCI API Gateway:** HTTPS Gateway providing entry points for AI clients connecting to MCP endpoints.
- **Private OCI Container Instance:** Hosting the 3 MCP server containers (Terraform, GitHub, and Playwright) connected exclusively through API Gateway.