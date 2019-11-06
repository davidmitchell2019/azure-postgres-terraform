provider "azurerm" {
  version = "=1.36.0"
}
terraform {
  backend "azurerm" {
    storage_account_name  = "dbsaccount"
    container_name        = "tfstatepostgres"
    key                   = "terraform.tfstate"
    resource_group_name  = "${azurerm_resource_group.postgres-sql.name}"
  }
}
