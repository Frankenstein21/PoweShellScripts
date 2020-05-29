# Descripción: Script para obtener información básica del equipo.
#              Se utiliza el estándar CIM, clase Win32_ComputerSystem.
# Fecha: Mayo 2020

Clear-Host

# Obtener nombre del Host
$HostName = (Get-CimInstance -ClassName Win32_ComputerSystem).Name

# Obtener el nombre del dominio
$Domain = (Get-CimInstance -ClassName Win32_ComputerSystem).Domain

# Obtener el nombre de usuario
$UserName = (Get-CimInstance -ClassName Win32_ComputerSystem).UserName

# Obtener tipo de equipo (Desktop o Laptop)
$Type = (Get-CimInstance -ClassName Win32_ComputerSystem).ChassisSKUNumber

# Obtener el fabricante del equipo
$Manufacturer = (Get-CimInstance -ClassName Win32_ComputerSystem).Manufacturer

# Obtener el modelo del equipo
$Model = (Get-CimInstance -ClassName Win32_ComputerSystem).Model

# Obtener la cantidad de memoria total
$Memory = (Get-CimInstance -ClassName Win32_ComputerSystem).TotalPhysicalMemory

# Obtener la cantidad de procesadores
$NumberProcessors = (Get-CimInstance -ClassName Win32_ComputerSystem).NumberOfProcessors

# Obtener la cantidad de procesadores
$NumberCores = (Get-CimInstance -ClassName Win32_ComputerSystem).NumberOfLogicalProcessors

# Write-Host "$HostName,$Domain,$UserName,$Type,$Manufacturer,$Model,$Memory,$NumberProcessors,$NumberCores"

Write-Host "Nombre de host: $HostName"
Write-Host "Nombre de dominio: $Domain"
Write-Host "Nombre de usuario: $UserName"
Write-Host "Tipo de equipo: $Type"
Write-Host "Fabricante: $Manufacturer"
Write-Host "Modelo: $Model"
Write-Host "Memoria instalada: $Memory"
Write-Host "Procesadores: $NumberProcessors procesador y $NumberCores núcleos"