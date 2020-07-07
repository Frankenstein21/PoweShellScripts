# Descripción: Script para crear redes virtuales y subredes

Clear-Host

Connect-AzAccount

# Se solicita por pantalla el nombre del grupo de recursos
# $RGroupName = Read-Host -Prompt "Escribe el nombre del grupo de recursos"
$RGroupName = "Test"

# Crear el grupo de recursos
$RGroup = New-AzResourceGroup -Name $RGroupName -Location 'East US' -Force

# Crear red virtual
$VNet1 = New-AzVirtualNetwork `
            -ResourceGroupName $RGroupName `
            -Location 'East US' `
            -Name VNet1 `
            -AddressPrefix 10.1.0.0/16

# Crear Subredes
$Subnet1 = Add-AzVirtualNetworkSubnetConfig `
                -Name Subnet1 `
                -AddressPrefix 10.1.0.0/24 `
                -VirtualNetwork $VNet1

# Asociar la subred a la red virtual creada
$Subnet1 | Set-AzVirtualNetwork 