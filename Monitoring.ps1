### SET FOLDER TO WATCH + FILES TO WATCH + SUBFOLDERS YES/NO
    $watcher = New-Object System.IO.FileSystemWatcher
    $watcher.Path = "C:\Users\*UserName*\Desktop\Spring4Shell_Searches\Recent"
    $watcher.Filter = "*.csv*"
    $watcher.IncludeSubdirectories = $true
    $watcher.EnableRaisingEvents = $true  

### DEFINE ACTIONS AFTER AN EVENT IS DETECTED
    $action = {Get-ChildItem -Filter *.csv -Path C:\Users\*UserName*\Desktop\Spring4Shell_Searches\Recent | Select-Object -ExpandProperty FullName | Import-Csv | Export-Csv C:\Users\*UserName*\Desktop\Spring4Shell_Searches\MasterDoc.csv -NoTypeInformation -Append
        Remove-Item C:\Users\*UserName*\Desktop\Spring4Shell_Searches\Recent\*.csv
              }    
### DECIDE WHICH EVENTS SHOULD BE WATCHED 
    Register-ObjectEvent $watcher "Created" -Action $action
    #while ($true) {Start-Sleep 5}