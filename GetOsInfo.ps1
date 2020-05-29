# Descripción: Script para obtener información básica del sistema operativo.
#              Se utiliza el estándar CIM, clase Win32_OperatingSystem.
# Fecha: Mayo 2020

Clear-Host

# Obtener nombre del sistema operativo
$OsName = (Get-CimInstance -ClassName Win32_OperatingSystem).Caption

# Obtener la versión del sistema operativo
$OsVersion = (Get-CimInstance -ClassName Win32_OperatingSystem).Version

# Obtener el número de compilación del sistema
$BuildNumber = (Get-CimInstance -ClassName Win32_OperatingSystem).BuildNumber

# Obtener el tipo de arquitectura del sistema
$Architecture = (Get-CimInstance -ClassName Win32_OperatingSystem).OSArchitecture

# Obtener la fecha de instalación del sistema
$InstallDate = (Get-CimInstance -ClassName Win32_OperatingSystem).InstallDate
# $InstallDate = Get-CimInstance -ClassName Win32_OperatingSystem | Select-Object -Property InstallDate

# Obtener fecha y hora del último arranque del sistema
$LastBootUp = (Get-CimInstance -ClassName Win32_OperatingSystem).LastBootUpTime
# $LastBootUp = Get-CimInstance -ClassName Win32_OperatingSystem | Select-Object -Property LastBootUpTime

# La opción de imprimir los valores en una líena se puede usar para manipular los datos desde otra aplicación, por ejemplo, GNet.
# Write-Host "$OsName,$OsVersion,$BuildNumber,$InstallDate,$FreeMemory,$VirtualMemory,$FreeVirtual,$LastBootUp"

# Imprimir valores en pantalla
Write-Host "Sistema Operativo: $OsName"
Write-Host "Versión del sistema: $OsVersion"
Write-Host "Número de compilación: $BuildNumber"
Write-Host "Arquitectura del sistema: $Architecture"
Write-Host "Fecha de instalación: $InstallDate"
Write-Host "Último arranque: $LastBootUp"