param ([string] $platform)

. $PSScriptRoot\..\UE-Utility.ps1

$ArchivedBuildsPath = Join-Path $PSScriptRoot -ChildPath "\..\..\..\ArchivedBuilds"
if (Test-Path $ArchivedBuildsPath) {
    Write-Host "Removing archived Builds '$ArchivedBuildsPath'"
    Remove-Item -Path $ArchivedBuildsPath -Recurse -Force
}