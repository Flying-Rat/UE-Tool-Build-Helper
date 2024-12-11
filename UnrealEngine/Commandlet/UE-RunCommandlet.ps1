param ([string] $commandletName, [string] $ProjectName, [string] $additionalArgs = $null)

. $PSScriptRoot\..\UE-Utility.ps1
. $PSScriptRoot\..\..\PS-Utility.ps1

Write-Host "Generating project files"
& $PSScriptRoot\..\Build\UE-GenerateProjectFiles.ps1 $projectName
VerifySuccess
Write-Host "Generating project files done"

Write-Host "Building Source"
& $PSScriptRoot\..\Build\UE-BuildSource.ps1 $projectName Win64 Shipping
VerifySuccess
Write-Host "Building Source Done"

$pathToUproject = GetPathToUProject $ProjectName

$arguments = "$pathToUproject", "-run=$commandletName", "-log"

if ($env:TEAMCITY_VERSION) {
    $arguments += "-unattended"
} 

if ($additionalArgs -ne $null -and $additionalArgs -ne "") {
    Write-Host "adding additional arguments: ' $additionalArgs'"
    $arguments += " " + $additionalArgs
}

Write-Host "Running commandlet: '$commandletName' with arguments: '$arguments'"
& $PSScriptRoot\..\UE-RunUnrealEd.ps1 $Arguments