provider "azurerm" {
  version = "=1.36.0"
}
resource "azurerm_storage_account" "dbsaccount" {
  name                     = "dbsaccount"
  resource_group_name      = "postgresql-database-deutsche-bank"
  location                 = "UK South"
  account_tier             = "Standard"
  account_replication_type = "GRS"
}
resource "azure_storage_blob" "tfstate" {
  name                   = "tfstate"
  storage_service_name   = "tfstate-store"
  storage_container_name = "terraform-storage-container"
  type                   = "PageBlob"
  size                   = 1024
}
terraform {
  backend "azurerm" {
    storage_account_name  = "tfstate"
    container_name        = "terraform-storage-container"
    key                   = "terraform.tfstate"
    resource_group_name  = "postgresql-database-deutsche-bank"
  }
}
