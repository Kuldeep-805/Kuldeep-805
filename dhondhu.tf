terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.38.1"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "59bea627-7b7a-4e47-bec4-fb0b51214f26"
}

resource "azurerm_resource_group" "rg-dhundhu" {
  name     = "rg-dhundhu"
  location = "West Europe"
}

