$path = ".\questions"
$filter = "*.*"

$watcher = New-Object System.IO.FileSystemWatcher
$watcher.Path = $path
$watcher.Filter = $filter
$watcher.IncludeSubdirectories = $false
$watcher.EnableRaisingEvents = $true

Register-ObjectEvent $watcher Created -Action {
    $filePath = $Event.SourceEventArgs.FullPath
    $fileName = $Event.SourceEventArgs.Name

    Write-Host "New file detected: $fileName"

    # 🔥 Run your script here
    & ".\Generate.ps1" -FilePath $filePath
}

Write-Host "Watching folder: $path"
while ($true) { Start-Sleep 1 }
