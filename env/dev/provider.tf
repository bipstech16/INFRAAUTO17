terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.43.0"
    }
  }
}

provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }

  }
  subscription_id = "c05900c4-9a99-417d-878e-413b907a6035"
}