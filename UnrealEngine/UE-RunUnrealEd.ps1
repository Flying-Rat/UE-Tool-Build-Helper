param ([string[]] $arguments)

. $PSScriptRoot\UE-Utility.ps1
. $PSScriptRoot\..\PS-Utility.ps1

$pathToUnrealEditor = GetPathToEditorCMD
Write-Host "Running UnrealEd '$pathToUnrealEditor $Arguments'"
& $pathToUnrealEditor $arguments