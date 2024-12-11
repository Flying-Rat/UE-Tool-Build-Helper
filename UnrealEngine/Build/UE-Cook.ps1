param (
    [string] $projectName,
    [string] $platform,
    [string] $configuration
)

. $PSScriptRoot\..\UE-Utility.ps1

$PathToUproject = GetPathToUProject $projectName
$Arguments = "BuildCookRun", "-skipbuild", "-cook", "-skipbuild", "-nocompileeditor", "-skippak", "-skipstage", "-targetplatform=$platform" , "-clientconfig=$configuration", "-ScriptsForProject=`"$PathToUProject`"", "-project=`"$PathToUProject`"", "-noP4", "-prereqs", "-separatedebuginfo", "-utf8output", "-unattended"
& $PSScriptRoot\..\UE-RunUAT.ps1 $Arguments