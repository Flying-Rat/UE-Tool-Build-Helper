param ([string[]] $arguments)

. $PSScriptRoot\UE-Utility.ps1
. $PSScriptRoot\..\PS-Utility.ps1

$PathToUAT = GetPathToUATBat
Write-Host "Running UAT '$PathToUAT $Arguments'"
& $PathToUAT $arguments
VerifySuccess