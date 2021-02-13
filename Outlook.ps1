# Descripción: Soluciona el error al iniciar Outlook provocado por una actualización de Teams. 
#              Elimina el complemento de programar reuniones de Teams en Outlook.         

Clear-Host

$MainPatch = "AppData\Local\Microsoft\TeamsMeetingAddin\"
$FilePatch = "x64\Microsoft.Teams.AddinLoader.dll"
$AddinPatch = Get-ChildItem -Path $HOME\$MainPatch -Name -Directory

foreach ($item in $AddinPatch) {    
    if (Test-Path $HOME\$MainPatch\$item\$FilePatch) {
        Remove-Item -Path $HOME\$MainPatch\$item\$FilePatch -Force   
    } else {
        Write-Host "Error, no se encontró el fichero. Contacta al Administrador"
    }
}