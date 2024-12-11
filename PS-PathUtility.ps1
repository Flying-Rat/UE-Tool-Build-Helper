# Get the value of an environment variable and check if it is a valid path throwing an error if it is not
function GetPathEnvironmentVariableChecked([string] $EnvironmentVariableName) {

    $EnvironmentVariable = [System.Environment]::GetEnvironmentVariable($EnvironmentVariableName)

    if (-not $EnvironmentVariable -or -not (Test-Path -Path $EnvironmentVariable)) {
        throw "Path to environment variable '$EnvironmentVariableName' does not exist"
    }

    return $EnvironmentVariable
}

function CheckPath([string] $Path) {

    if (-not (Test-Path -Path $Path)) {
        throw "Path '$Path' does not exist"
    }
}