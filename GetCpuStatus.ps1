# Descripción: El Script sirve para monitorizar el estado de la CPU.
# obtiene información del procesador, número de núcleos y el procentaje de uso
# Fecha: Mayo 2020  
Clear-Host

$Name = (Get-CimInstance -ClassName Win32_Processor).Name
$NumberCores = (Get-CimInstance -ClassName Win32_Processor).NumberOfCores
$Load = (Get-CimInstance -ClassName Win32_Processor).LoadPercentage

# Write-Host "$Name,$NumberCores,$Load"
Write-Host "Procesador: $Name"
Write-Host "Núcleos: $NumberCores"
Write-Host "En uso: $Load%"