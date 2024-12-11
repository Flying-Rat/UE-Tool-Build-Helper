param (
    [string] $projectName,
    [string] $platform,
    [string] $configuration
)

. $PSScriptRoot\..\UE-Utility.ps1

$PathToUproject = GetPathToUProject $projectName
$Arguments = "BuildCookRun", "-archive", "-skipstage", "-skippackage", "-skipcook", "-skipbuild", "-nocompileeditor", "-targetplatform=$platform" , "-clientconfig=$configuration", "-ScriptsForProject=`"$PathToUProject`"", "-project=`"$PathToUProject`"", "-noP4", "-prereqs", "-separatedebuginfo", "-utf8output", "-unattended"
& $PSScriptRoot\..\UE-RunUAT.ps1 $Arguments