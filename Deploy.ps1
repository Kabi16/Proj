Expand-Archive -LiteralPath "C:\Workspace\BuildPipeline\src\dotnetHelloWorld\bin\Release\package.zip" -DestinationPath "C:\DeployLogs2"
Move-Item –Path C:\DeployLogs2\Content\C_C\Workspace\BuildJob\src\dotnetHelloWorld\obj\Release\netcoreapp2.1\PubTmp\Out -Destination C:\DeploySite2
$APPPOOL_NAME="DeployPool2"
$SITE_NAME="Deploy2"
$PORT=5001
$PATH="C:\DeploySite2\Out"
New-WebAppPool -Force -Name "$APPPOOL_NAME"
Set-ItemProperty -Path IIS:\AppPools\$APPPOOL_NAME managedRuntimeVersion "v4.0"
New-Item IIS:\Sites\$SITE_NAME -physicalPath $PATH -bindings @{protocol="http";bindingInformation="*:${PORT}:"}
Set-ItemProperty IIS:\Sites\$SITE_NAME -name applicationPool -value $APPPOOL_NAME
