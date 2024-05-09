variable "vnet_name" {
  description = "Name of the virtual network"
  type        = string
}

variable "location" {
  description = "Location of the resource"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "address_space" {
  description = "Address space of the virtual network"
  type        = list(string)
}

variable "subnets" {
  description = "Map of subnets. The map key is the name of the subnet."
  type = map(object({
    subnet_address_prefixes = list(string)
  }))
}

variable "security_groups" {
  description = "Map of security groups"
  type = map(object({
    security_rules = optional(map(object({
      priority                     = number
      direction                    = string
      access                       = string
      protocol                     = string
      source_port_range            = optional(string)
      source_port_ranges           = optional(list(string), [])
      destination_port_range       = optional(string)
      destination_port_ranges      = optional(list(string), [])
      source_address_prefix        = optional(string)
      source_address_prefixes      = optional(list(string), [])
      destination_address_prefix   = optional(string)
      destination_address_prefixes = optional(list(string), [])
    })), {})
    subnet_keys = list(string)
  }))
  default = {}
}
