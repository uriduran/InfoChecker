
$pcname = $env:computername

$ipconfig = ipconfig

Write-Output $pcname $ipconfig | Out-File $pcname'.txt' -Append

