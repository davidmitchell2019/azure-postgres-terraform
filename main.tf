provider "azurerm" {
  version = "=1.36.0"
}
data "terraform_remote_state" "state" {
  backend = "azurerm"
  config = {
    storage_account_name  = "${var.storage_account_name}"
    container_name        = "${var.storage_container_name}"
    key                   = "terraform.tfstate"
    resource_group_name  = "${var.resource_group_name}"
  }
}
