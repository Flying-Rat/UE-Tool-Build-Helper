# Get locally added files using git ls-files
$addedFiles = git ls-files --others --exclude-standard

$totalMBAdded = 0

$IterationCount = 0
# Iterate over each locally added file
foreach ($file in $addedFiles) {

    # Get the full path of the file
    $fullPath = Join-Path -Path (Get-Item -Path ".\").FullName -ChildPath $file

    # Get the file size
    $fileSize = (Get-Item $fullPath).Length / 1MB

    # Check if file size exceeds 100MB
    if ($fileSize -gt 100) {
        # Add file to git LFS in .gitattributes
        Add-Content -Path ".gitattributes" -Value "$file filter=lfs diff=lfs merge=lfs -text"
        
        # Track file in git LFS
        git lfs track "$file"
        Write-Host "File $file added to git LFS"

        $totalMBAdded += $fileSize
    }
    else  {
        Write-Host "Staging $file"
        # stage the file
        git add $file
    }

    $IterationCount++

    if ($IterationCount -gt 10000) {
        return
    }
}

Write-Host "Total size of files added to git LFS: $totalMBAdded MB"

# # Function to recursively delete .gitignore files
# function DeleteNestedGitignoreFiles {
#     param (
#         [string]$directory
#     )

#     # Get all .gitignore files in the current directory
#     $gitignoreFiles = Get-ChildItem -Path $directory -Filter ".gitignore" -File

#     foreach ($file in $gitignoreFiles) {
#         # Check if the .gitignore file is not in the root directory
#         if ($file.Directory.FullName -ne $rootDirectory) {
#             Write-Host "Deleting $($file.FullName)"
#             Remove-Item -Path $file.FullName -Force
#         }
#     }

#     # Recursively call the function for each subdirectory
#     $subDirectories = Get-ChildItem -Path $directory -Directory
#     foreach ($subDir in $subDirectories) {
#         DeleteNestedGitignoreFiles -directory $subDir.FullName
#     }
# }

# # Call the function to delete nested .gitignore files
# DeleteNestedGitignoreFiles -directory $PSScriptRoot