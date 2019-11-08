resource "azurerm_virtual_network" "vnet" {
  name                = "example-vnet"
  address_space       = ["10.10.10.0/24"]
  location            = "UKSouth"
  resource_group_name = "${var.resource_group_name}"
}

resource "azurerm_subnet" "subnet" {
  name                 = "subnet"
  resource_group_name  = "${var.resource_group_name}"
  virtual_network_name = "${azurerm_virtual_network.vnet.name}"
  address_prefix       = "10.10.10.0/24"
  service_endpoints    = ["Microsoft.Sql"]
}
resource "azurerm_postgresql_virtual_network_rule" "test" {
  name                                 = "postgresql-vnet-rule"
  resource_group_name                  = "${var.resource_group_name}"
  server_name                          = "postgresql-database-deutsche-bank"
  subnet_id                            = "${azurerm_subnet.subnet.id}"
  ignore_missing_vnet_service_endpoint = true
}
