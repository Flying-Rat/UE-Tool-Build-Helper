param (
    [string] $projectName,
    [string] $platform,
    [string] $configuration
)

. $PSScriptRoot\..\..\PS-Utility.ps1

Write-Host "Invoking Build project name '$projectName', platform '$platform', configuration '$configuration'"

Write-Host "Clean Staged Builds"
& $PSScriptRoot\UE-CleanPreviousBuilds.ps1
Write-Host "Clean Staged Builds Done"

Write-Host "Generating project files"
& $PSScriptRoot\UE-GenerateProjectFiles.ps1 $projectName
VerifySuccess
Write-Host "Generating project files done"

Write-Host "Building Source"
& $PSScriptRoot\UE-BuildSource.ps1 $projectName $platform $configuration
VerifySuccess
Write-Host "Building Source Done"

Write-Host "Cook Content"
& $PSScriptRoot\UE-Cook.ps1 $projectName $platform $configuration
VerifySuccess
Write-Host "Cook Content Done"

Write-Host "Package"
& $PSScriptRoot\UE-StageAndPackage.ps1 $projectName $platform $configuration
VerifySuccess
Write-Host "Package Done"

Write-Host "Archiving Content"
& $PSScriptRoot\UE-Archive.ps1 $projectName $platform $configuration
VerifySuccess
Write-Host "Archiving Content Done"