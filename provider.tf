terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.40.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "59bea627-7b7a-4e47-bec4-fb0b51214f26"
  client_id = "88a5638a-4425-414a-81cd-218eeb730d1f"
  client_secret = "qKu8Q~9ZP0JnYbsW.bALA73yaj~BXQY5AaeOKcuU"
  tenant_id = "b045856a-3dc6-4e42-9811-6dd226cc9800"
}
