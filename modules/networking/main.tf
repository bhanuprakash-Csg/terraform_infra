# Create Virtual Network
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
}

# Create Public Subnet
resource "azurerm_subnet" "public_subnet" {
  name                 = var.public_subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.public_subnet_prefix

  depends_on = [azurerm_virtual_network.vnet]
}

# Create Private Subnet
resource "azurerm_subnet" "private_subnet" {
  name                 = var.private_subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.private_subnet_prefix
  service_endpoints    = ["Microsoft.Storage"]
  # Add delegation for MySQL Flexible Server
  delegation {
    name = "mysql-delegation"

    service_delegation {
      name = "Microsoft.DBforMySQL/flexibleServers"
      actions = [
        "Microsoft.Network/virtualNetworks/subnets/join/action",
      ]
    }
  }
  depends_on = [azurerm_virtual_network.vnet]
}

# Create Network Security Group (NSG)
resource "azurerm_network_security_group" "nsg" {
  name                = var.nsg_name
  location            = var.location
  resource_group_name = var.resource_group_name
}

# Allow SSH (Port 22) for Public Subnet
resource "azurerm_network_security_rule" "ssh_rule" {
  name                        = "AllowSSH"
  priority                    = 1000
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "*"  # Update to a specific IP for security
  destination_address_prefix  = "*"
  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.nsg.name

  depends_on = [azurerm_network_security_group.nsg]
}

# Allow MySQL (Port 3306) only from Public Subnet (VM)
resource "azurerm_network_security_rule" "mysql_rule" {
  name                        = "AllowMySQL"
  priority                    = 1010
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "3306"
  source_address_prefix       = azurerm_subnet.public_subnet.address_prefixes[0]  # Allow only from VM subnet
  destination_address_prefix  = "*"
  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.nsg.name

  depends_on = [azurerm_network_security_group.nsg, azurerm_subnet.public_subnet]
}

# Attach NSG to Public Subnet
resource "azurerm_subnet_network_security_group_association" "public_nsg_assoc" {
  subnet_id                 = azurerm_subnet.public_subnet.id
  network_security_group_id = azurerm_network_security_group.nsg.id

  depends_on = [azurerm_subnet.public_subnet, azurerm_network_security_group.nsg]
}

# Attach NSG to Private Subnet
resource "azurerm_subnet_network_security_group_association" "private_nsg_assoc" {
  subnet_id                 = azurerm_subnet.private_subnet.id
  network_security_group_id = azurerm_network_security_group.nsg.id

  depends_on = [azurerm_subnet.private_subnet, azurerm_network_security_group.nsg]
}

# Create Private DNS Zone for MySQL
resource "azurerm_private_dns_zone" "mysql_private_dns" {
  name                = "privatelink.mysql.database.azure.com"
  resource_group_name = var.resource_group_name

   depends_on = [azurerm_virtual_network.vnet]

}

# Link the Private DNS Zone to the VNet
resource "azurerm_private_dns_zone_virtual_network_link" "mysql_dns_link" {
  name                  = "mysql-dns-link"
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.mysql_private_dns.name
  virtual_network_id    = azurerm_virtual_network.vnet.id

  depends_on = [azurerm_virtual_network.vnet, azurerm_private_dns_zone.mysql_private_dns]
}

# output "mysql_private_dns_zone_id" {
#   value = azurerm_private_dns_zone.mysql_private_dns.id
# }
