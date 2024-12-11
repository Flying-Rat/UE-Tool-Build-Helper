. $PSScriptRoot\..\PS-PathUtility.ps1

function GetPathToEditor {

    $LocalEnginePath = Join-path $PSScriptRoot -ChildPath "..\..\..\"

    if (Test-Path $LocalEnginePath) {
        return $LocalEnginePath
    }
    
    return GetPathEnvironmentVariableChecked("UE_INSTALL_DIR")
}

function GetPathToEditorCMD {
    
    $PathToEditor = GetPathToEditor

    $pathToUnrealEditorCMD = Join-Path $PathToEditor -ChildPath "Engine/Binaries/Win64/UnrealEditor-Cmd.exe"
    CheckPath $pathToUnrealEditorCMD
    return $pathToUnrealEditorCMD
}

function GetPathToEditorExe {
        
        $PathToEditor = GetPathToEditor
    
        $pathToUnrealEditorExe = Join-Path $PathToEditor -ChildPath "Engine/Binaries/Win64/UnrealEditor.exe"
        CheckPath $pathToUnrealEditorExe
        return $pathToUnrealEditorExe
}

function GetPathToUProject([string] $projectName) {

    $UProjectDir = GetPathToUProjectDir
    $pathToUProject = Join-Path $UProjectDir -ChildPath "$projectName.uproject"
    CheckPath $pathToUProject
    return $pathToUProject
}

function GetPathToUProjectDir {

    $UProjectDir = Join-Path $PSScriptRoot -ChildPath "../.."
    CheckPath $UProjectDir
    return $UProjectDir
}

function GetPathToUBTDir {

    $PathToEditor = GetPathToEditor

    $pathToUnrealEditorCMD = Join-Path $PathToEditor -ChildPath "Engine/Binaries/DotNET/UnrealBuildTool/"
    CheckPath $pathToUnrealEditorCMD
    return $pathToUnrealEditorCMD
}

function GetPathToBatchFiles {

    $PathToEditor = GetPathToEditor
    
    $PathToBatchFiles = Join-Path $PathToEditor -ChildPath "Engine\Build\BatchFiles\"
    CheckPath $PathToBatchFiles
    return $PathToBatchFiles
}

function GetPathToUATBat {

    $PathToBatchFiles = GetPathToBatchFiles
    $PathToUATBat = Join-Path $PathToBatchFiles -ChildPath "RunUAT.bat"
    CheckPath $PathToUATBat
    return $PathToUATBat
}

function GetPathToUBTBat {

    $PathToBatchFiles = GetPathToBatchFiles
    $PathToUBTBat = Join-Path $PathToBatchFiles -ChildPath "Build.bat"
    CheckPath $PathToUBTBat
    return $PathToUBTBat
}