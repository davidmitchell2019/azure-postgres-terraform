resource "azurerm_postgresql_server" "postgres-server" {
  name                         = "postgresql-database-deutsche-bank"
  resource_group_name          = "${var.resource_group_name}"
  location                     = "UK South"
  version                      = "10.0"
  administrator_login          = "${var.database-login}"
  administrator_login_password = "${var.database-password}"
  ssl_enforcement              = "Enabled"
  sku {
   name     = "GP_Gen5_2"
   capacity = 2
   tier     = "GeneralPurpose"
   family   = "Gen5"
  }
  storage_profile {
    storage_mb            = 5120
    backup_retention_days = 7
    geo_redundant_backup  = "Disabled"
  }
}

resource "azurerm_postgresql_database" "postgres-db" {
  name                = "mysqldatabase"
  resource_group_name = "${var.resource_group_name}"
  server_name         = "${azurerm_postgresql_server.postgres-server.name}"
  charset             = "UTF8"
  collation           = "English_United States.1252"
}
