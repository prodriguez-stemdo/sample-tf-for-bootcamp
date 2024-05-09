vpcs = {
  "demo-vpc-01" = {
    name                = "demo-vpc-01"
    location            = "westeurope"
    resource_group_name = "demo-rg-01"
    address_space       = ["10.0.0.0/8"]
    subnets = {
      "subnet-01" = {
        subnet_address_prefixes = ["10.0.0.0/16"]
      }
      "subnet-02" = {
        subnet_address_prefixes = ["10.1.0.0/16"]
      }
    }
    security_groups = {
      "demo-nsg-01" = {
        security_group_name = "sg-01"
        security_rules = {
          "deny-inbound-ssh" = {
            priority                   = 100
            direction                  = "Inbound"
            access                     = "Deny"
            protocol                   = "Tcp"
            source_port_range          = "*"
            destination_port_range     = "22"
            source_address_prefix      = "*"
            destination_address_prefix = "*"
          }
        }
        subnet_keys = ["subnet-01", "subnet-02"]
      }
    }
  }
  "demo-vpc-02" = {
    name                = "demo-vpc-02"
    location            = "westeurope"
    resource_group_name = "demo-rg-02"
    address_space       = ["11.0.0.0/8"]
    subnets = {
      "subnet-01" = {
        subnet_address_prefixes = ["11.0.1.0/24"]
      }
    }
  }
  "demo-vpc-03-same-rg" = {
    name                = "demo-vpc-03-same-rg"
    location            = "westeurope"
    resource_group_name = "demo-rg-01"
    address_space       = ["10.0.0.0/8"]
  }
}
