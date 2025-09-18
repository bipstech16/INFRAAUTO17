resource "azurerm_lb" "lb" {
  name                = var.lb_name
  location            = var.location
  resource_group_name = var.resource_group_name

  frontend_ip_configuration {
    name                 = var.fe_name
    public_ip_address_id = var.public_ip_address_id
  }
}


resource "azurerm_lb_backend_address_pool" "bepool" {
  name                = var.pool_name
  loadbalancer_id     = azurerm_lb.lb.id

}

resource "azurerm_lb_probe" "probe" {
  name                = "ssh-running-probe"
  loadbalancer_id     = azurerm_lb.lb.id
  protocol            = "Tcp"
  port                = 22
}


resource "azurerm_lb_rule" "rule" {
  name                           = "LBRule"
  loadbalancer_id                = azurerm_lb.lb.id
  protocol                       = "Tcp"
  frontend_port                  = 3389
  backend_port                   = 3389
  frontend_ip_configuration_name = var.fe_name
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.bepool.id]
  probe_id                       = azurerm_lb_probe.probe.id
}



