# Conectar a Exhange Online
# Connect-ExchangeOnline -UserPrincipalName admin@test.onmicrosoft.com

# Obtener y listar las políticas de buzón de correo de OWA
# Get-OwaMailboxPolicy | Select-Object Identity, SetPhotoEnabled

# Modificar la política de buzón de correo de OWA específica
$policyName="OwaMailboxPolicy-Default"
Set-OwaMailboxPolicy -Identity "$policyName" -SetPhotoEnabled $false