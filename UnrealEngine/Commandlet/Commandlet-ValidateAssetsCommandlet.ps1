param ([string] $ProjectName, [string]$AssetsDirectories = "", [bool]$IncludeEngineContent = $false)

$LogDirectory = Join-Path $PSScriptRoot "..\..\..\Saved\Logs"
$ValidAssetsPath = Join-Path $LogDirectory "ValidAssets.txt"
$InvalidAssetsPath = Join-Path $LogDirectory "InvalidAssets.txt"
$NotValidatedAssetsPath = Join-Path $LogDirectory "NotValidatedAssets.txt"

if (Test-Path $ValidAssetsPath) {
    Remove-Item $ValidAssetsPath
}

if (Test-Path $InvalidAssetsPath) {
    Remove-Item $InvalidAssetsPath
}

if (Test-Path $NotValidatedAssetsPath) {
    Remove-Item $NotValidatedAssetsPath
}

$ParamsString = $null
if ($AssetsDirectories -ne "") {
    $ParamsString = "-AssetsDirectories=$AssetsDirectories"
}
if ($IncludeEngineContent) {
    $ParamsString += " -IncludeEngineContent"
}

& .\UE-RunCommandlet.ps1 -commandletName "UltimateAssetValidator.ValidateAssetsCommandlet" -ProjectName $ProjectName $ParamsString

$IsEverythingValid = $true
$ErrorString += "Valid Assets:`n"    
if (Test-Path $ValidAssetsPath) {
    $ValidAssets = Get-Content $ValidAssetsPath
    if ($ValidAssets.Count -gt 0) {
        $ErrorString += $ValidAssets -join "`n"
        $ErrorString += "`n"
    }
}

$ErrorString += "----------------------------------`n"

$ErrorString += "Invalid Assets:`n"
if (Test-Path $InvalidAssetsPath) {
    $InvalidAssets = Get-Content $InvalidAssetsPath
    if ($InvalidAssets.Count -gt 0) {
        $ErrorString += $InvalidAssets -join "`n"
        $ErrorString += "`n"
        $IsEverythingValid = $false
    }
}

$ErrorString += "----------------------------------`n"

$ErrorString += "Not Validated Assets:`n"
if (Test-Path $NotValidatedAssetsPath) {
    $NotValidatedAssets = Get-Content $NotValidatedAssetsPath
    if ($NotValidatedAssets.Count -gt 0) {
        $ErrorString += $NotValidatedAssets -join "`n"
        $ErrorString += "`n"
        $IsEverythingValid = $false
    }
}
$ErrorString += "----------------------------------`n"

if (!$IsEverythingValid) {
    $ReportString = "Not all assets are valid, see all issues: `n----------------------------------`n"
    $ReportString += $ErrorString
    Write-Error $ErrorString
    throw 1
}
else {
    $ReportString = "All assets are valid but with warnings:`n"
    $ReportString += $ErrorString
    Write-Host $ReportString
}