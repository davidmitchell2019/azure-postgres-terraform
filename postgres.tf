resource "azurerm_resource_group" "postgres-sql" {
  name     = "postgresql-database"
  location = "UK South"
}

resource "azurerm_sql_server" "postgres-server" {
  name                         = "mysqlserver"
  resource_group_name          = "${azurerm_resource_group.postgres-sql.name}"
  location                     = "UK South"
  version                      = "12.0"
  administrator_login          = "${var.database-login}"
  administrator_login_password = "${var.database-password}"
}

resource "azurerm_sql_database" "postgres-db" {
  name                = "mysqldatabase"
  resource_group_name = "${azurerm_resource_group.postgres-sql.name}"
  location            = "UK South"
  server_name         = "${azurerm_sql_server.postgres-server.name}"
}
