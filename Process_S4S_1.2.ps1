#Adding dependencies for popups
Add-Type -AssemblyName PresentationFramework
Add-Type -AssemblyName System.Windows.Forms

#Adding headers for csv creation
$props = [ordered]@{
    'AgentVersion' = ""
    'ComputerName' = ""
    'Version' = ""
    'aid' = ""
    'cmdLine' = ""
    'falconEvents' = ""
    'fileName' = ""
    'productType' = ""
    'springVerCheck' = ""
    'totalEvents' = ""}

#Test the path of the needed folder. If its there do nothing, if it isnt create it.
#$Check = Test-Path C:\Users\$env:UserName\Desktop\Spring4Shell_Searches\Recent
$Check = Test-Path C:\Users\$env:UserName\Desktop\Spring4Shell_Searches

#Check if working folders already exist, if not then create them
#Process the csv's that are in "Recent" and input them into the masterdoc
if ($Check)
{
    [System.Windows.MessageBox]::Show("Spring4Shell files successfully processed!")
    Get-ChildItem -Filter *.csv -Path C:\Users\$env:UserName\Desktop\Spring4Shell_Searches\Recent | Select-Object -ExpandProperty FullName | Import-Csv | Export-Csv C:\Users\$env:UserName\Desktop\Spring4Shell_Searches\MasterDoc.csv -NoTypeInformation -Append
    Remove-Item C:\Users\$env:UserName\Desktop\Spring4Shell_Searches\Recent\*.csv	
}
Else
{
	[System.Windows.MessageBox]::Show("Required file path's are not present, creating them now...")
	New-Item C:\Users\$env:UserName\Desktop\Spring4Shell_Searches -ItemType "directory"
    New-Item C:\Users\$env:UserName\Desktop\Spring4Shell_Searches\Recent -ItemType "directory"
	New-Object PsObject -Property $props | Export-Csv C:\Users\$env:UserName\Desktop\Spring4Shell_Searches\MasterDoc.csv -NoTypeInformation -Force
    
}

#Used to troubleshoot running on desktop.
#Read-Host -Prompt "Press Enter to exit"