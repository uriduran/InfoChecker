
$pcname = $env:computername
$user = $env:UserName
$domain = $env:UserDomain
$MAC = getmac
$OSName = Get-WmiObject Win32_OperatingSystem
$Serial = wmic bios get serialnumber
$CPUName = Get-WmiObject -Class Win32_Processor -ComputerName . | Select-Object -Property Name
$PCModel = Get-WmiObject -Class Win32_ComputerSystem


$InstalledRAM = Get-WmiObject -Class Win32_ComputerSystem
$TotalRAM = [Math]::Round(($InstalledRAM.TotalPhysicalMemory/ 1GB),2)

$os = get-wmiobject win32_operatingsystem
$OSDate = $os.ConvertToDateTime($os.InstallDate) -f "MM/dd/yyyy" 

$ipconfig = ipconfig | findstr [0-9].\.

Write-Output $user $pcname $domain $ipconfig $MAC $OSName $PCModel $CPUName $TotalRAM $Serial $OSDate | Out-File $pcname'.txt' -Append

