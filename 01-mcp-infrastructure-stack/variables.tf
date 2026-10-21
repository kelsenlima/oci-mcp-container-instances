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

variable "container_instance_ocpus" {
  type        = number
  default     = 2
  description = "Quantidade de OCPUs para a Container Instance"
}

variable "container_instance_memory_in_gbs" {
  type        = number
  default     = 16
  description = "Quantidade de memória em GB para a Container Instance"
}