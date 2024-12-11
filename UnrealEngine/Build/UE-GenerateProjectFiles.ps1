param ([string] $projectName)

. $PSScriptRoot\..\UE-Utility.ps1

$UProjectPath = GetPathToUProject $projectName
$BatchFilesDir = GetPathToBatchFiles
$PathToGenerateProjectFiles = Join-Path $BatchFilesDir -ChildPath "GenerateProjectFiles.bat"

& $PathToGenerateProjectFiles "-project=`"$UProjectPath`""