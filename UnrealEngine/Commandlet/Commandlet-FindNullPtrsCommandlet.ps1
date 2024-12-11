param ([string] $ProjectName, [string]$AssetsDirectories = "")

$LogDirectory = Join-Path $PSScriptRoot "..\..\..\Saved\Logs"
$NullPtrPropertiesPath = Join-Path $LogDirectory "NullPtrProperties.txt"

if (Test-Path $NullPtrPropertiesPath) {
    Remove-Item $NullPtrPropertiesPath
}

$ParamsString = $null
if ($AssetsDirectories -ne "") {
    $ParamsString = "-AssetsDirectories=$AssetsDirectories"
}

& .\UE-RunCommandlet.ps1 -commandletName "UltimateAssetValidator.FindNullPtrsCommandlet" -ProjectName $ProjectName $ParamsString

if (Test-Path $NullPtrPropertiesPath) {
    $ErrorString += "NullPtrs found:`n"
    $NullPtrs = Get-Content $NullPtrPropertiesPath
    $ErrorString += $NullPtrs -join "`n"
    $ErrorString += "`n"
    Write-Error $ErrorString
    throw 1
}
else {
    Write-Host "No NullPtrs found"
}