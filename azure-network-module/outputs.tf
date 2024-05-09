output "virtual_network" {
  value = azurerm_virtual_network.this
}

output "subnets" {
  value = azurerm_subnet.this
}

output "security_groups" {
  value = module.security_groups
}