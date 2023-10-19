# Conectar a Exhange Online
# Connect-ExchangeOnline -UserPrincipalName admin@test.onmicrosoft.com

# Ruta de la imagen que se asignará como foto de perfil
$imagenPath = "C:\temp\2.jpg"

# Obtener todos los buzones de correo y establecer la foto de perfil
Get-EXOMailbox -ResultSize Unlimited | ForEach-Object {
    Set-UserPhoto -Identity "$_" -PictureData ([System.IO.File]::ReadAllBytes("$imagenPath")) -Confirm:$false
    $_.DisplayName
}

# Desconectar la sesión de PowerShell
# Disconnect-ExchangeOnline -Confirm:$false