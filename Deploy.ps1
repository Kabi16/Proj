Expand-Archive -LiteralPath "C:\Workspace\BuildJob\src\dotnetHelloWorld\bin\Release\package.zip" -DestinationPath "C:\DeployLogs"
Move-Item –Path C:\DeployLogs\Content\C_C\Workspace\BuildJob\src\dotnetHelloWorld\obj\Release\netcoreapp2.1\PubTmp\Out -Destination C:\DeploySite
$APPPOOL_NAME="DeployPool"
$SITE_NAME="Deploy"
$PORT=5000
$PATH="C:\DeploySite\Out"
New-WebAppPool -Force -Name "$APPPOOL_NAME"
Set-ItemProperty -Path IIS:\AppPools\$APPPOOL_NAME managedRuntimeVersion "v4.0"
New-Item IIS:\Sites\$SITE_NAME -physicalPath $PATH -bindings @{protocol="http";bindingInformation="*:${PORT}:"}
Set-ItemProperty IIS:\Sites\$SITE_NAME -name applicationPool -value $APPPOOL_NAME