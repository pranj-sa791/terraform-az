terraform {
    required_providers {
        azurerm = {
            source = "hashicorp/azurerm"
            version = "~> 4.21.1"
        }
    }
    required_version = ">= 1.9.0"
}

provider "azurerm" {
    features {}
}

resource "azurerm_resource_group" "az_rg" {
    name    = "myResourceGroup-demo-rg"
    location = "East US"
}

resource "azurerm_storage_account" "az_sa" {
    name                     = "mystrgaccountdemosa"
    resource_group_name      = azurerm_resource_group.az_rg.name
    location                 = azurerm_resource_group.az_rg.location
    account_tier             = "Standard"
    account_replication_type = "GRS"
}