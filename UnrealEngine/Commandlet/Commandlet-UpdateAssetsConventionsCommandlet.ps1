param ([string] $ProjectName, [string]$AssetsDirectories = "", [bool]$IncludeEngineContent = $false)

$ParamsString = ""
if ($AssetsDirectories -ne "") {
    $ParamsString = "-AssetsDirectories=$AssetsDirectories"
}
if ($IncludeEngineContent) {
    $ParamsString += " -IncludeEngineContent"
}

& .\UE-RunCommandlet.ps1 -commandletName "ConventionDignifier.UpdateAssetsConventionsCommandlet" -ProjectName $ProjectName $ParamsString