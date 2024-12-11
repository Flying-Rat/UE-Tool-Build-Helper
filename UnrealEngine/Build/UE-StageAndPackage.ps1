param (
    [string] $projectName,
    [string] $platform,
    [string] $configuration
)

. $PSScriptRoot\..\UE-Utility.ps1

$PathToUproject = GetPathToUProject $projectName
$Arguments = "BuildCookRun", "-pak", "-stage", "-package", "-skipbuild", "-skipcook", "-nocompileeditor", "-targetplatform=$platform" , "-clientconfig=$configuration", "-ScriptsForProject=`"$PathToUProject`"", "-project=`"$PathToUProject`"", "-noP4", "-prereqs", "-separatedebuginfo", "-utf8output", "-unattended"
& $PSScriptRoot\..\UE-RunUAT.ps1 $Arguments