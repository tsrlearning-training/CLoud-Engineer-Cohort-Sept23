variable "client_id" {
  description = "(Optional) The Client ID which should be used. This can also be sourced from the ARM_CLIENT_ID Environment Variable."
  type        = string
  default     = "b26145ad-4bdc-4af7-bc86-8dc3d89e9d4e"
}

variable "subscription_id" {
  description = "(Optional) The Subscription ID which should be used. This can also be sourced from the ARM_SUBSCRIPTION_ID Environment Variable."
  type        = string
  default     = "f823a9e2-b296-41ab-b452-5f2c01eefae8"
}

variable "tenant_id" {
  description = "(Optional) The Tenant ID which should be used. This can also be sourced from the ARM_TENANT_ID Environment Variable."
  type        = string
  default     = "389dc11c-508a-4f1e-a529-1f19aa1a8e7b"
}

variable "client_secret" {
  description = "(Optional) The Client Secret which should be used. This can also be sourced from the ARM_CLIENT_SECRET Environment Variable."
  type        = string
}

variable "nsg_name" {
  description = "(Required) Specifies the name of the network security group. Changing this forces a new resource to be created."
  type        = string
}

variable "pip_name" {
  description = "(Required) Specifies the name of the Public IP. Changing this forces a new Public IP to be created."
  type        = string
}

variable "virtual_network_name" {
  description = " (Required) The name of the virtual network. Changing this forces a new resource to be created."
  type        = string
}

variable "vnet_address_space" {
  description = "(Required) The address space that is used the virtual network. You can supply more than one address space."
  type        = list(string)
}

variable "subnet_name" {
  description = "(Required) The name of the subnet. Changing this forces a new resource to be created."
  type        = string
}

variable "snet_address_prefixes" {
  description = "(Required) The address prefixes to use for the subnet."
  type        = list(string)
}

variable "nic_name" {
  description = "(Required) The name of the Network Interface. Changing this forces a new resource to be created."
  type        = string
}

variable "resource_group_name" {
  description = "(Required) The Name which should be used for this Resource Group. Changing this forces a new Resource Group to be created."
  type        = string
}

variable "virtual_machine_name" {
  description = "(Required) The name of the Linux Virtual Machine. Changing this forces a new resource to be created."
  type        = string
}

variable "source_address_prefix" {
  description = "value"
  type        = string
}

variable "disk_size_gb" {
  description = "Disk Size to be attached"
  type        = string
}

variable "db_user" {
  description = "Database USerName"
  type        = string
}

variable "db_name" {
  description = "Database Name"
  type        = string
}

variable "linux_user" {
  description = "Linux UserName"
  type        = string
}