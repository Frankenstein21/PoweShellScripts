# Este Script copia los archivos creados o modificados a partir de una fecha indicada.
Clear-Host

$Origen = Read-Host "Escibe la dirección de origen"
while (-NOT (Test-Path $Origen)) {
    Write-Host "El directorio no existe. Escribe un dirección válida"
    $Origen = Read-Host "Escibe la direcció de origen"
}

$Destino = Read-Host "Escribe la dirección de destino"
If (-NOT (Test-Path $Destino)) { 
    New-Item -ItemType Directory $Destino | Out-Null 
} 
 
$Fecha = Read-Host "Especifíca la antiguedad máxima (yyyyMMdd), ejemplo: 20200320"

Robocopy $Origen $Destino /MAXAGE:$Fecha /s