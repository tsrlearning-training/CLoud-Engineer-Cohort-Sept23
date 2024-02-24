variable "pip_name" {
  description = "(Required) Specifies the name of the Public IP. Changing this forces a new Public IP to be created."
  type        = string
  default     = ""
}

variable "virtual_network_name" {
  description = "(Required) The name of the virtual network. Changing this forces a new resource to be created."
  type        = string
  default     = ""
}

variable "vnet_address_space" {
  description = "(Required) The address space that is used the virtual network. You can supply more than one address space."
  type        = list(string)
}

variable "resource_group_name" {
  description = "(Required) The Name which should be used for this Resource Group. Changing this forces a new Resource Group to be created."
  type        = string
}

variable "location" {
  description = "Where Azure resource is deployed to"
  type        = string
}
