# Path to file with interesting registry key paths
$file = 'C:\PATH\REG\FILE\reg.txt'

foreach($line in Get-Content $file) {

	# If registry path exist in system then Get registry key
   if(Test-Path -Path Registry::$line){
        Get-Item -Path Registry::$line
   }
}
