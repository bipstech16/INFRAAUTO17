terraform {
  backend "azurerm" {
    resource_group_name  = "myproject"                            # Can also be set via `ARM_USE_AZUREAD` environment variable.
    tenant_id            = "efeb520c-f48c-485c-95c5-be148c93599f" # Can also be set via `ARM_TENANT_ID` environment variable. Azure CLI will fallback to use the connected tenant ID if not supplied.
    storage_account_name = "myprojsta"                            # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
    container_name       = "myproject"                            # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    key                  = "dev.terraform.tfstate"      
    
      
       # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.


  }
}
