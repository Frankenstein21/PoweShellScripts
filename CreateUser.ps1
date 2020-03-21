# Creación de un usuario
$usuario = Read-Host "Introduce el nombre de usuario"
$pass = Read-Host "Introduce la contraseña" -AsSecureString
New-LocalUser $usuario -Password $pass
Add-LocalGroupMember usuarios -Member $usuario