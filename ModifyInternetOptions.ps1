# Descripción: Este Script realiza la configuración en Intenet Explorer para el acceso a NetBank
# Fecha: Abril de 2020

Clear-Host

# Variables que almacenan las rutas
# ----------------------------------
$ZonesPathReg = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2'
$SitePathReg = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range1'
$Server = '10.0.40.15'

If (-NOT (Test-Path $ZonesPathReg)) { 
    New-Item $ZonesPathReg | Out-Null
}

# Controles y complementos de ActiveX
# -----------------------------------------
# Comportamiento de binarios y de Scripts
Set-ItemProperty $ZonesPathReg -Name 2000 -Value 0 -Type DWORD

# Descargar controles AxtiveX firmados
Set-ItemProperty $ZonesPathReg -Name 1001 -Value 0 -Type DWORD

# Descargar los controles ActiveX sin firmar
Set-ItemProperty $ZonesPathReg -Name 1004 -Value 0 -Type DWORD

# Ejecutar controles y complementos de ActiveX
Set-ItemProperty $ZonesPathReg -Name 1200 -Value 0 -Type DWORD

# Ejecutar Software antimalware en los controles ActiveX
Set-ItemProperty $ZonesPathReg -Name 270C -Value 0 -Type DWORD

# Inicializar y generar scripts de los controles ActiveX no marcados como seguros para scripts
Set-ItemProperty $ZonesPathReg -Name 1201 -Value 0 -Type DWORD

# Mostrar vídeos y animaciones en una página web que no usa un reproductor multimedia externo
Set-ItemProperty $ZonesPathReg -Name 120A -Value 0

# Pedir intervencion del usuario automatica para controles ActiveX
Set-ItemProperty $ZonesPathReg -Name 2201 -Value 0 -Type DWORD

# Permitir el filtrado ActiveX
Set-ItemProperty $ZonesPathReg -Name 2702 -Value 0 -Type DWORD

# Permitir que solo los dominios aprobados utilicen ActiveX sin preguntar
Set-ItemProperty $ZonesPathReg -Name 120B -Value 3 -Type DWORD

# Permitir que todos los controles ActiveX no usados anteriormente se ejecuten sin preguntar
Set-ItemProperty $ZonesPathReg -Name 1208 -Value 0 -Type DWORD

# Permitir Scriptlets
Set-ItemProperty $ZonesPathReg -Name 1209 -Value 0 -Type DWORD

# Miscelánea
# ------------------------------------------
# Usar el bloqueador de elementos emergentes
Set-ItemProperty $ZonesPathReg -Name 1809 -Value 3 -Type DWORD

# Usar SmartScreen de Windows Defender
Set-ItemProperty $ZonesPathReg -Name 2301 -Value 3 -Type DWORD

# Agregar la IP del servidor web o el nombre de dominio a la lista de sitios de confianza
If (-NOT (Test-Path $SitePathReg)) { 
    New-Item $SitePathReg | Out-Null
}
Set-ItemProperty $SitePathReg -Name :Range -Value $Server -Type String
Set-ItemProperty $SitePathReg -Name https -Value 2 -Type DWORD

Write-Host "¡La configuración se realizó correctamente!"`n

# Configuración complemento de impresiones
# -------------------------------------------
# $FilePrint = 'C:\Netbank\Impresion\ImpresionNetBank.dll'
# $PathDest = 'C:\Axon'
# if (-NOT (Test-Path $PathDest)) {
#     New-Item -Path C:\ -Name Axon -ItemType Directory | Out-Null
# }

# if (Test-Path $FilePrint) {
#     Copy-Item "$FilePrint" -Destination "$PathDest"
#     regsvr32 C:\Axon\ImpresionNetBank.dll
# } else {
#     Write-Host "No se pudo encontrar el archivo ImpresionNetBank.dll"`n
# }