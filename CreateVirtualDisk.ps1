# creación automática de un disco virtual
$disco = Read-Host "Nombre del disco (path): "
[double]$tamano = Read-Host "Tamaño del disco en Bytes: "
New-VHD -Path $disco -SizeBytes $tamano -Dynamic
Mount-VHD -Path $disco -Passthru|
Initialize-Disk -PassThru|
New-Partition -AssignDriveLetter -UseMaximumSize|
Format-Volume -FileSystem NTFS -Confirm:$false