# Creating the Resource group
resource "azurerm_resource_group" "rg1" {
  name     = var.rg_name
  location = var.location
}

#Creating the Application insight
resource "azurerm_application_insights" "azai" {
  name                = "abhi_appi_testing_2021"
  location            = azurerm_resource_group.rg1.location
  resource_group_name = azurerm_resource_group.rg1.name
  application_type    = "web"
}

#Creating the key Vault for ML Workspace
resource "azurerm_key_vault" "azkv" {
  name                = "abhikvtesting2021"
  location            = azurerm_resource_group.rg1.location
  resource_group_name = azurerm_resource_group.rg1.name
  tenant_id           = var.tenant_id
  sku_name            = "premium"
}

# Creating the Storage account for ML Workspace
resource "azurerm_storage_account" "azsa" {
  name                     = "abhisatesting20210607"
  location                 = azurerm_resource_group.rg1.location
  resource_group_name      = azurerm_resource_group.rg1.name
  account_tier             = "Standard"
  account_replication_type = "GRS"
}

# Creating the machine learning workspcae
resource "azurerm_machine_learning_workspace" "azmlw" {
  name                    = "abhi_mlw_testing2021"
  location                = azurerm_resource_group.rg1.location
  resource_group_name     = azurerm_resource_group.rg1.name
  application_insights_id = azurerm_application_insights.azai.id
  key_vault_id            = azurerm_key_vault.azkv.id
  storage_account_id      = azurerm_storage_account.azsa.id

  identity {
    type = "SystemAssigned"
  }
}
