param ([string] $ProjectName, [string]$additionalArgs = $null)

& .\UE-RunCommandlet.ps1 -commandletName "ResavePackagesCommandlet" -ProjectName $ProjectName -additionalArgs $additionalArgs