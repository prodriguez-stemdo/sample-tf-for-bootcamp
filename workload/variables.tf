variable "vpcs" {
  description = "values for the vpcs"
  type = map(object({
    name                = string
    location            = optional(string, "westeurope")
    resource_group_name = string
    address_space       = list(string)
    subnets = optional(map(object({
      subnet_address_prefixes = list(string)
    })), {})
    security_groups = optional(map(object({
      security_group_name = string
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
    })), {})
  }))
  default = {}
}
