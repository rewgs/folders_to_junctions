<#
Makes junctions to all folders within a folder. Useful for making a sample libraries directory, regardless of drive letters or drive scheme.
Alex Ruger, 2021
#>

# Prompt user for folder in which to create junctions      (i.e. "Path")
$path = "C:\Users\Danny Elfman\Documents\make_junction_for_all_folders_test"
Write-Host "Creating junctions in $path."
Write-Host `n
Write-Host "If you would like to select a different path, please edit the source code."
Write-Host `n

# Prompt user for folder from which to create junctions    (i.e. "Target")
$target = Read-Host -Prompt "Input the directory from which to create junctions"
Write-Host `n
Write-Host "Will make junctions for all folders in $target."
Write-Host `n

# Create junctions
$target_subdirectories = @(Get-ChildItem -Path $target)
foreach ($target_subdirectory in $target_subdirectories) {
    $path_subdirectory = $path
    $path_subdirectory = $path + "\$target_subdirectory"
    $target_subdirectory = $target + "$target_subdirectory"
    New-Item -ItemType Junction -Path $path_subdirectory -Target $target_subdirectory
}

Write-Host `n
Write-Host "Exiting in 10 seconds."
Start-Sleep -s 10