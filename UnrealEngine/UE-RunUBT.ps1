param ([string[]] $arguments)

. $PSScriptRoot\UE-Utility.ps1
. $PSScriptRoot\..\PS-Utility.ps1

$PathToUBT = GetPathToUBTBat
Write-Host "Running UBT '$PathToUBT $Arguments'"
& $PathToUBT $arguments
VerifySuccess