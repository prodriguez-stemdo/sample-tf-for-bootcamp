output "network_security_group" {
  value = azurerm_network_security_group.this
}

output "network_security_rules" {
  value = azurerm_network_security_rule.this
}

output "subnet_network_security_group_associations" {
  value = azurerm_subnet_network_security_group_association.this
}