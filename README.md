# OCI Container Instances & MCP Server Framework

## 🇧🇷 Português (PT-BR)

### Descrição
Este repositório contém os módulos de automação e Infraestrutura como Código (IaC via Terraform) para implantação de servidores **Model Context Protocol (MCP)** em **OCI Container Instances**, integrando Agentes de IA a ferramentas de automação e bases de conhecimento.

### Arquitetura de Módulos
- **`01-mcp-infrastructure-stack/`**: Automação da infraestrutura base (VCN, Subnets, OCI Container Instance com shapes flexíveis de OCPU/Memória e políticas IAM).
- **`02-terraform-mcp-server/`**: Configuração e implantação do servidor MCP para operações de Infraestrutura como Código.
- **`03-github-mcp-server/`**: Integração do servidor MCP com APIs e repositórios do GitHub.
- **`04-playwright-mcp-server/`**: Automação de navegadores e testes E2E/Web utilizando o Playwright MCP.

---

## 🇺🇸 English (EN)

### Description
This repository contains the automation modules and Infrastructure-as-Code (IaC via Terraform) for deploying **Model Context Protocol (MCP)** servers on **OCI Container Instances**, connecting AI Agents with automation tools and knowledge sources.

### Module Architecture
- **`01-mcp-infrastructure-stack/`**: Provisioning of base infrastructure (VCN, Subnets, OCI Container Instance with flexible OCPU/Memory shapes, and IAM policies).
- **`02-terraform-mcp-server/`**: Setup and deployment of the MCP server for Infrastructure-as-Code operations.
- **`03-github-mcp-server/`**: Integration of the MCP server with GitHub APIs and repositories.
- **`04-playwright-mcp-server/`**: Browser automation and E2E/Web testing using Playwright MCP.

---

## 👨‍💻 Autor / Author
Desenvolvido por **Kelsen Lima** para o programa **Oracle ACE Apprentice**[cite: 4].  
*(Developed by Kelsen Lima for the Oracle ACE Apprentice program[cite: 4].)*