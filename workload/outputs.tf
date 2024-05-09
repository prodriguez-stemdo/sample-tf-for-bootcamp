output "resource_groups" {
  value = azurerm_resource_group.rgs
}

output "vpcs" {
  value = module.vpcs
}