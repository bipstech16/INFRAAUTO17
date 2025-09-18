# module "rgs" {
#   source              = "../../modules/rg-microtodoui-dev-eus-01"
#   resource_group_name = "rg-microtodoui-dev-eus-01"
#   location            = "East US"
# }

# module "vnet" {
#   depends_on          = [module.rgs]
#   source              = "../../modules/vnet-microtodoui-dev-eus-01"
#   name                = "vnet-microtodoui-dev-eus-01"
#   location            = module.rgs.location
#   address_space       = ["10.0.0.0/16"]
#   resource_group_name = module.rgs.resource_group_name

# }

# module "subnet" {
#   depends_on           = [module.rgs, module.vnet]
#   source               = "../../modules/snet-app-dev-eus-01"
#   name                 = "snet-app-dev-eus-01"
#   resource_group_name  = module.rgs.resource_group_name
#   virtual_network_name = module.vnet.vnet_name
#   address_prefixes     = ["10.0.1.0/24"]
# }


# module "stgacc" {
#   depends_on               = [module.rgs]
#   source                   = "../../modules/stmicrotodouidev01"
#   name                     = "stmicrotodouidev01"
#   resource_group_name      = module.rgs.resource_group_name
#   location                 = module.rgs.location
#   account_tier             = "Standard"
#   account_replication_type = "LRS"
# }

# module "stgcont" {
#   depends_on            = [module.stgacc, module.rgs]
#   source                = "../../modules/stc-microtodoui-dev-eus-01"
#   name                  = "microtodoui-dev-eus-01"
#   storage_account_id    = module.stgacc.id
#   container_access_type = "private"

# }


# module "lb_pip" {
#   depends_on          = [module.rgs]
#   source              = "../../modules/pip-microtodoui-dev-eus-01"
#   name                = "pip-microtodoui-dev-eus-01"
#   resource_group_name = module.rgs.resource_group_name
#   location            = module.rgs.location
#   allocation_method   = "Static"
# }


# module "nic1" {
#   depends_on                    = [module.rgs, module.vnet, module.subnet]
#   source                        = "../../modules/nic-vm1-microtodoui-dev-eus-01"
#   name                          = "nic-vm1-microtodoui-dev-eus-01"
#   location                      = module.rgs.location
#   resource_group_name           = module.rgs.resource_group_name
#   subnet_id                     = module.subnet.subnet_id
#   private_ip_address_allocation = "Dynamic"

# }

# module "nic2" {
#   depends_on                    = [module.rgs, module.vnet, module.subnet]
#   source                        = "../../modules/nic-vm1-microtodoui-dev-eus-01"
#   name                          = "nic-vm2-microtodoui-dev-eus-01"
#   location                      = module.rgs.location
#   resource_group_name           = module.rgs.resource_group_name
#   subnet_id                     = module.subnet.subnet_id
#   private_ip_address_allocation = "Dynamic"

# }

# module "nsg" {
#   depends_on          = [module.rgs, module.vnet, module.subnet, module.nic1]
#   source              = "../../modules/nsg-microtodoui-dev-eus-01"
#   name                = "nsg-microtodoui-dev-eus-01"
#   location            = module.rgs.location
#   resource_group_name = module.rgs.resource_group_name
# }


# module "nsg_association" {
#   depends_on                = [module.rgs, module.vnet, module.subnet, module.nsg, module.nic1, module.nic2]
#   source                    = "../../modules/network_security_group_association"
#   subnet_id                 = module.subnet.subnet_id
#   network_security_group_id = module.nsg.nsg_id

# }

# module "vm1" {
#   depends_on            = [module.rgs, module.vnet, module.subnet, module.nic1, module.nsg, module.nsg_association]
#   source                = "../../modules/vm1-microtodoui-dev-eus-01"
#   name                  = "vm1-microtodoui-dev-eus-01"
#   location              = module.rgs.location
#   resource_group_name   = module.rgs.resource_group_name
#   network_interface_ids = [module.nic1.id]
#   vm_size               = "Standard_B1s"
#   disk                  = "myosdisk1"
# }

# module "vm2" {
#   depends_on            = [module.rgs, module.vnet, module.subnet, module.nic2, module.nsg, module.nsg_association]
#   source                = "../../modules/vm1-microtodoui-dev-eus-01"
#   name                  = "vm2-microtodoui-dev-eus-01"
#   location              = module.rgs.location
#   resource_group_name   = module.rgs.resource_group_name
#   network_interface_ids = [module.nic2.id]
#   vm_size               = "Standard_B1s"
#   disk                  = "myosdisk2"
# }


# module "aks" {
#   depends_on          = [module.rgs]
#   source              = "../../modules/aks-microtodoui-dev-eus-01"
#   name                = "aks-microtodoui-dev-eus-01"
#   location            = module.rgs.location
#   resource_group_name = module.rgs.resource_group_name
#   dns_prefix          = "aks-microtodoui-dev-eus-01"
# }

# module "acr" {
#   source              = "../../modules/acrmicrotodouidev01"
#   acr_name            = "acrmicrotodouidev1995"
#   location            = module.rgs.location
#   resource_group_name = module.rgs.resource_group_name
# }


# module "azureBastionSubnet" {
#   depends_on           = [module.rgs, module.vnet]
#   source               = "../../modules/snet-app-dev-eus-01"
#   name                 = "AzureBastionSubnet"
#   resource_group_name  = module.rgs.resource_group_name
#   virtual_network_name = module.vnet.vnet_name
#   address_prefixes     = ["10.0.2.0/24"]
# }

# module "bast_pip" {
#   depends_on          = [module.rgs]
#   source              = "../../modules/pip-microtodoui-dev-eus-01"
#   name                = "pip-bast-microtodoui-dev-eus-01"
#   resource_group_name = module.rgs.resource_group_name
#   location            = module.rgs.location
#   allocation_method   = "Static"

# }

# module "azurerm_bastion_host" {
#   source               = "../../modules/bas-microtodoui-dev-eus-01"
#   bastion_name         = "bst-microtodoui-dev-eus-01"
#   location             = module.rgs.location
#   resource_group_name  = module.rgs.resource_group_name
#   name                 = "configuration"
#   subnet_id            = module.azureBastionSubnet.subnet_id
#   public_ip_address_id = module.bast_pip.pip_id

# }


# module "sql" {
#   depends_on          = [module.rgs]
#   source              = "../../modules/sql-microtodoui-dev-eus-01"
#   name                = "sql-microtodoui-dev-eus-01"
#   resource_group_name = module.rgs.resource_group_name
#   location            = "Central US"
#   usr                 = "missadministrator"
#   pwd                 = "Admin@1234567!"
# }

# module "lbrule-nic1" {
#   depends_on            = [module.rgs, module.lb_pip, module.nic1, module.nic2, module.vm1, module.vm2]
#   source                = "../../modules/lb-microtodoui-dev-eus-01"
#   lb_name               = "lb-microtodoui-dev-eus-01"
#   location              = module.rgs.location
#   resource_group_name   = module.rgs.resource_group_name
#   fe_name               = "PublicIPAddress"
#   public_ip_address_id  = module.lb_pip.pip_id
#   pool_name             = "mypool"

# }

