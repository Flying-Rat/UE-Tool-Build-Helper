param ([string] $ProjectName, [string]$additionalArgs = $null)

& .\UE-RunCommandlet.ps1 -commandletName "ConvergenceEditor.CompileGameBlueprints" -ProjectName $ProjectName -additionalArgs $additionalArgs