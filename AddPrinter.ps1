
# Instalar una impresora Ricoh MP 4055
# Pasos manuales:
# --------------- 
# - Descargar el controlador de esta dirección: http://support.ricoh.com/bb/html/dr_ut_e/rc3/model/mp2595/mp2595.htm?lang=es
# - Ejecutar el .exe para descomprimir. Por omisión se descomprime en el directorio: C:\temp
# - Agregar el controlador al amacén. Para ello, ubicar el fichero oemsetup.inf en el directorio C:\temp\z91999L16\disk1, clic derecho e instalar.                 

$DriverName = "RICOH MP 4055 PCL 6"
$IpAddress = "10.6.100.101"
$PrinterName = "RICOH MP 4055 - CONTA"

Add-PrinterDriver -Name "$DriverName"
Add-PrinterPort -Name "$IpAddress" -PrinterHostAddress "$IpAddress"
Add-Printer -Name "$PrinterName" -DriverName "$DriverName" -PortName "$IpAddress"