locals {
  resource_groups = distinct([for v in var.vpcs: {
    name = v.resource_group_name
    location = v.location
  }])
}

resource "azurerm_resource_group" "rgs" {
  for_each = { for rg in local.resource_groups : "${rg.name}-${rg.location}" => rg}
  name     = each.value.name
  location = each.value.location
}

module "vpcs" {
  depends_on = [ azurerm_resource_group.rgs ]
  source = "../azure-network-module"
  for_each = var.vpcs

  vnet_name = each.value.name
  location = each.value.location
  resource_group_name = each.value.resource_group_name
  address_space = each.value.address_space
  subnets = each.value.subnets
  security_groups = each.value.security_groups
}