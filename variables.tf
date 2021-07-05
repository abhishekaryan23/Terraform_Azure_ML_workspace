provider "azurerm" {
    subscription_id = var.subscription_id
    client_id = var.client_id
    client_secret = var.client_secret
    tenant_id = var.tenant_id
    
    features {}
}

variable "subscription_id" {
  description ="Enter you subscription ID to provision resource in Azure"
}

variable "client_id" {
  description ="Enter you Client Id created for your created application in Azure AD"
}

variable "client_secret" {
  description ="Enter your Password created for your Application in Azure AD "
}

variable "tenant_id" {
  description ="Enter your Tenant ID / Directory ID of your Azure AD"
}

variable "rg_name" {
  description = "Enter the name for your Resource Group"
}

variable "location" {
  description = "Enter the location for your Resource group"
}