# Note: Without administrator privileges can not save logs "Security"

# Get event log list
$list = Get-EventLog -List |  Select-Object -Property Log

# Create "Logfiles" direction on Desktop
New-Item -Path ([Environment]::GetFolderPath("Desktop")) -Name "Logfiles" -ItemType "directory"

# Save copy of every event log file in "Logfiles" folder
foreach($LogName in $list) {

    (Get-WmiObject -Class Win32_NTEventlogFile | Where-Object LogfileName -Match $LogName.Log).BackupEventlog(([Environment]::GetFolderPath("Desktop"))+"\Logfiles\"+$LogName.Log+'.evtx' )

} 
