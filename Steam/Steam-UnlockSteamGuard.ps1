param (
        [string]
        $SteamGuardCode
)

. $PSScriptRoot\Steam-Utility.ps1

$SteamUserName = GetSteamUserName
$SteamPassword = GetSteamPassword
$SteamGuardCode = $SteamGuardCode

$Arguments = "+login $SteamUserName $SteamPassword $SteamGuardCode +quit"

Start-Process -FilePath $(RunSteamCMD) -ArgumentList $Arguments -NoNewWindow -Wait