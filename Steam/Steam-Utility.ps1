. $PSScriptRoot\..\PS-PathUtility.ps1

function RunSteamCMD {

    $LocalSteamCMDPath = Join-path $PSScriptRoot "SteamCMD\steamcmd.exe"

    if (Test-Path $LocalSteamCMDPath) {
        return $LocalSteamCMDPath
    }
}

function GetTimestamp {

    $Timestamp = Get-Date -UFormat "%d/%m/%Y %R"
    return $Timestamp
}


function GetRevision {

    $Revision = "Unknown"
    return $Revision
}

function GetSteamUserName {

    $AccessPath = Join-Path $PSScriptRoot "Access/Access.txt"
    if (Test-Path $AccessPath) {
        $Content = Get-Content $AccessPath
        $SteamUserName = $Content[0]
    }
    else {
        $SteamUserName = $env:STEAM_ACCOUNT_USERNAME
    }

    if (-not $SteamUserName)
    {
        Write-Host "Cannot obtain steam username. Either fill STEAM_ACCOUNT_USERNAME environment variable or create Access.txt file in Steam folder with username and password."
        exit 1
    }

    return $SteamUserName
}

function GetSteamPassword {

    $AccessPath = Join-Path $PSScriptRoot "Access/Access.txt"
    if (Test-Path $AccessPath) {
        $Content = Get-Content $AccessPath
        $SteamPassword = $Content[1]
    }
    else {
        $SteamPassword = $env:STEAM_ACCOUNT_PASSWORD
    }

    if (-not $SteamPassword)
    {
        Write-Host "Cannot obtain steam password. Either fill STEAM_ACCOUNT_PASSWORD environment variable or create Access.txt file in Steam folder with username and password."
        exit 1
    }

    return $SteamPassword
}