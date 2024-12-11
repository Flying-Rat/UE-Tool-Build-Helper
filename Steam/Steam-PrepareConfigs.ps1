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

# Specify path to template file and path where the final config will be placed
$DeployConfigPathTemplate = Join-Path "$PSScriptRoot\Config" "$($ProjectName)Template.vdf"
$DeployConfigPath = Join-Path "$PSScriptRoot\Config" "$($ProjectName).vdf"

# Read the content of the file
$ConfigContent = Get-Content -Path $DeployConfigPathTemplate

# Update branch name
$ModifiedConfig = $ConfigContent.Replace("{branch}", $SteamBranch)

# Update description
$ModifiedConfig = $ModifiedConfig.Replace("{description}", "New build at $(GetTimestamp) from revision $($VCSRevision) on branch $($VCSBranch)")

# Update path to project artifacts
$ModifiedConfig = $ModifiedConfig.Replace("{artifacts}", $ArtifactsPath)

# Save the modified content back to the file
Set-Content -Path $DeployConfigPath -Value $ModifiedConfig