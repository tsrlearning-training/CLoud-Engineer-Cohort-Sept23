variable "rg" {
  description = "(Required) The Name which should be used for this Resource Group. Changing this forces a new Resource Group to be created."
  type        = string
  default     = ""
}

variable "location" {
  description = "Where Azure resource is deployed to"
  type        = string
}

variable "tags" {
  description = "Tags allocated to resources deployed in azure"
  type        = map(any)
}