terraform {
  required_version = ">=1.0.0"
  required_providers{
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">=2.0"
    }
  }
}

provider "azurerm" {
  features{}
}

data "azurerm_client_config" "current" {}


resource "azurerm_resource_group" "myrg1222" {
  name     = var.resourcegroupname
  location = var.resourcegrouplocation
}

resource "azurerm_key_vault" "myakv-ltim" {
  name                        = var.keyvalutname
  location                    = azurerm_resource_group.myrg1222.location
  resource_group_name         = azurerm_resource_group.myrg1222.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "Get",
    ]

    storage_permissions = [
      "Get",
    ]
  }
}

