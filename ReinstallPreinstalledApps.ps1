# Este Script sirve para reinstalar las aplicaciones preinstaladas en Windows 10
Clear-Host
# Obtenga todos los paquetes aprovisionados
$Packages = (get-item 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Applications') | Get-ChildItem

# Filtre la lista si tiene un filtro
$PackageFilter = $args[0]
if ([string]::IsNullOrEmpty($PackageFilter)) {
	echo "Sin filtro especificado, intentando volver a registrar todas las aplicaciones aprovisionadas."
}
else {
	$Packages = $Packages | where {$_.Name -like $PackageFilter} 

	if ($Packages -eq $null) {
		echo "Ninguna aplicación aprovisionada coincide con el filtro especificado."
		exit
	}
	else {
		echo "Registrar las aplicaciones aprovisionadas que coinciden con $PackageFilter."
	}
}

ForEach($Package in $Packages) {
	# obtener el nombre y la ruta del paquete
	$PackageName = $Package | Get-ItemProperty | Select-Object -ExpandProperty PSChildName
	$PackagePath = [System.Environment]::ExpandEnvironmentVariables(($Package | Get-ItemProperty | Select-Object -ExpandProperty Path))

	# registrar el paquete	
	echo "Intentando registrar el paquete: $PackageName"

	Add-AppxPackage -register $PackagePath -DisableDevelopmentMode
}