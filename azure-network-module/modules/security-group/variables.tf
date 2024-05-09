variable "security_group_name" {
  description = "Name of the security group"
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

variable "security_rules" {
  description = <<-EOF
  Map of security rules. 
  The properties:

   - source_port_range/s
   - destination_port_range/s
   - source_address_prefix/s
   - destination_address_prefix/s
  
  are mutually exclusive between the singular and plural forms.
  The plural form is overriden by the singular form if both are set.
  EOF
  type = map(object({
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
  }))
  default = {}
}

variable "subnet_ids" {
  description = "List of subnet IDs to associate with the security group"
  type        = list(string)
  default     = []
}
