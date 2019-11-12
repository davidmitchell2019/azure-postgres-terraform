#Azure resource manager provider
provider "azurerm" {
  version = "=1.36.0"
}
#Set the backend to be Azure storage using data as it allows me to pass variables into it
terraform {
  backend "azurerm" {
    key                   = "terraform.tfstate"
  }
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
