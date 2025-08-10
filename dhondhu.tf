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
  subscription_id = "afccf28c-f7d6-4ac4-8791-80052ef33d1b"
}

resource "azurerm_resource_group" "rg-dhundhu" {
  name     = "rg-dhundhu"
  location = "West Europe"
}
