Get-ChildItem -Filter *.csv -Path C:\Users\$env:UserName\Desktop\Spring4Shell_Searches\Recent | Select-Object -ExpandProperty FullName | Import-Csv | Export-Csv C:\Users\$env:UserName\Desktop\Spring4Shell_Searches\MasterDoc.csv -NoTypeInformation -Append
        Remove-Item C:\Users\$env:UserName\Desktop\Spring4Shell_Searches\Recent\*.csv