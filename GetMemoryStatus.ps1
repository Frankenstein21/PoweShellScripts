
Clear-Host

$Total = Get-CimInstance -ClassName Win32_ComputerSystem | Select-Object -Property TotalPhysicalMemory | ForEach-Object {$_.TotalPhysicalMemory / 1GB}
$TotalMemory = (Get-CimInstance -ClassName Win32_ComputerSystem).TotalPhysicalMemory
$FreeMemory = (Get-CimInstance -ClassName Win32_OperatingSystem).FreePhysicalMemory
$VirtualMemory = (Get-CimInstance -ClassName Win32_OperatingSystem).TotalVirtualMemorySize
$FreeVirtual = (Get-CimInstance -ClassName Win32_OperatingSystem).FreeVirtualMemory
$Memory = (Get-CimInstance -ClassName Win32_PhysicalMemory).Capacity
$Capacity = Get-CimInstance -ClassName Win32_PhysicalMemory | Select-Object -Property Capacity | ForEach-Object {$_.capacity / 1GB}



Write-Host "Memoria total: $TotalMemory"
Write-Host "$Total"
Write-Host "Memoria disponible: $FreeMemory"
Write-Host "Memoria virtual: $VirtualMemory"
Write-Host "Memoria virtual disponible: $FreeVirtual"

Write-Host "$Memory"
Write-Host "$Capacity"