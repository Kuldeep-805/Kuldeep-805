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

resource "azurerm_network_security_group" "Dhundhu" {
  name                = "nsg-dhundhu"
  location            = azurerm_resource_group.west_europe.location
  resource_group_name = azurerm_resource_group.west_europe.name
}

resource "azurerm_virtual_network" "dhundhu" {
  name                = "dhundhu-network"
  location            = azurerm_resource_group.West Europe.location
  resource_group_name = azurerm_resource_group.rg-dhundhu.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name             = "subnet1"
    address_prefixes = ["10.0.1.0/24"]
  }

  subnet {
    name             = "subnet2"
    address_prefixes = ["10.0.2.0/24"]
    security_group   = azurerm_network_security_group.example.id
  }

  tags = {
    environment = "Production"
  }
}


resource "azurerm_virtual_machine" "main" {
  name                  = "${var.prefix}-vm"
  location              = azurerm_resource_group.west europe.location
  resource_group_name   = azurerm_resource_group.dhandhu.name
  network_interface_ids = [azurerm_network_interface.main.id]
  vm_size               = "Standard_DS1_v2"

storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "hostname"
    admin_username = "testadmin"
    admin_password = "Password1234!"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = {
    environment = "staging"
  }
}
