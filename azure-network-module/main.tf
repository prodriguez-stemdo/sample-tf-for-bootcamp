resource "azurerm_virtual_network" "this" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
}

resource "azurerm_subnet" "this" {
  for_each = var.subnets
  name                 = each.key
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = each.value.subnet_address_prefixes
}

module "security_groups" {
  source               = "./modules/security-group"
  for_each = var.security_groups
  security_group_name  = each.key
  location             = var.location
  resource_group_name  = var.resource_group_name
  security_rules       = each.value.security_rules
  subnet_ids           = [for subnet_key in each.value.subnet_keys : azurerm_subnet.this[subnet_key].id]
}