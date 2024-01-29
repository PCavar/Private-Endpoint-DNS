variable "prefix" {
  default = "non-prod"
}

variable "region" {
  type        = string
  description = "Region for deployed resources"
  default     = "Sweden Central"
}

variable "main_rg" {
  type        = string
  description = "Main resource-group for this assignment"
  default     = "Private-Endpoint-DNS-RG"
}

variable "nsg-1" {
  type        = string
  description = "This NSG will be assigned to vm-1"
  default     = "nsg-1"
}

variable "main_vnet" {
  type = map(object({
    vnet_name           = string
    vnet_cidr           = string
    subnet_1_cidr       = string
    subnet_1_name       = string
    subnet_bastion_cidr = string
    subnet_bastion_name = string
  }))
  default = {
    vnet1 = {
      vnet_name           = "Vnet-1"
      vnet_cidr           = "20.0.0.0/16"
      subnet_1_cidr       = "20.0.0.0/24"
      subnet_1_name       = "subnet-1"
      subnet_bastion_cidr = "20.0.3.0/27"
      subnet_bastion_name = "AzureBastionSubnet"
    }
  }
}

variable "vnet2" {
  type = map(object({
    vnet_name             = string
    vnet_cidr             = string
    subnet_1_cidr         = string
    subnet_1_name         = string
    inbound_endpoint_name = string
    inbound_endpoint_cidr = string
  }))
  default = {
    vnet2 = {
      vnet_name             = "Vnet-2"
      vnet_cidr             = "30.1.0.0/16"
      subnet_1_cidr         = "30.1.0.0/24"
      subnet_1_name         = "subnet-1"
      inbound_endpoint_name = "subnet-resolver"
      inbound_endpoint_cidr = "30.1.1.0/28"
    }
  }
}

variable "vm1_password" {
  type        = string
  description = "Password for VM1"
  sensitive   = true
}

variable "main_appservice_plan" {
  type        = string
  description = "Name of App Serviceplan"
  default     = "app-service-pcpc"
}

variable "main_webapp_name" {
  type        = string
  description = "Name of Webapp"
  default     = "webapp-pcpc"
}

variable "main_private_endpoint_name" {
  type        = string
  description = "Name of private endpoint"
  default     = "Private-Endpoint"
}
