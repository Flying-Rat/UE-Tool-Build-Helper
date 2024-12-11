param (
        [Parameter(Position=0,mandatory=$true)]
        [string]
        $ProjectName,

        [Parameter(Position=1,mandatory=$true)]
        [string]
        $ArtifactsPath,

        [Parameter(Position=2,mandatory=$true)]
        [string]
        $SteamBranch,
        
        [Parameter(Position=3,mandatory=$true)]
        [string]
        $VCSBranch,

        [Parameter(Position=4,mandatory=$true)]
        [string]
        $VCSRevision
)

. $PSScriptRoot\..\PS-PathUtility.ps1
. $PSScriptRoot\Steam-Utility.ps1

Write-Host "ProjectName $ProjectName"
Write-Host "Artifacts $ArtifactsPath"
Write-Host "SteamBranch $SteamBranch"
Write-Host "VCS Branch $VCSBranch"
Write-Host "VCS Revision $VCSRevision"

#Prepare configs for steam
& $PSScriptRoot\Steam-PrepareConfigs.ps1 $ProjectName $ArtifactsPath $SteamBranch $VCSBranch $VCSRevision 

$SteamDeployConfigPath = Join-Path "$PSScriptRoot\Config" "$ProjectName.vdf"
CheckPath $SteamDeployConfigPath

$SteamUserName = GetSteamUserName
$SteamPassword = GetSteamPassword

$Arguments = "+login $SteamUserName $SteamPassword +run_app_build $SteamDeployConfigPath +quit"

Write-Host "Starting steam upload using config: $ProjectName"

Start-Process -FilePath $(RunSteamCMD) -ArgumentList $Arguments -NoNewWindow -Wait