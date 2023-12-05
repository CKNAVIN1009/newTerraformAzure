terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}
provider "azurerm" {
    features {
      
    }
  
}
# Create  a Resource Group
resource "azurerm_resource_group" "anshu_rg" {
    name = "anshuterraformrg"
    location = "eastus"
  
}
# Create a Storage Account
resource "azurerm_storage_account" "anshusa" {
  name                     = "anshustorage"
  resource_group_name      = azurerm_resource_group.anshu_rg.name
  location                 = azurerm_resource_group.anshu_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"


  static_website {
    index_document = "index.html"
  }
} 
# Add a index.html file to storage Account
resource "azurerm_storage_blob" "anshu_blob" {
    name = "index.html"
    storage_account_name   = azurerm_storage_account.anshusa.name
  storage_container_name = "$web"
  type = "Block"
  content_type = "text/html"
  source_content = "<h1> hellow world, This is NaveenTechnology </h1>"
  
}
