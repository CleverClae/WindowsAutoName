# Create a tag file just so Intune knows this was installed
if (-not (Test-Path "$($env:ProgramData)\Naming\Autoname\")) {
	Mkdir " $($env:ProgramData)\Naming\Autoname\"
}
Set-Content -Path "$($env:ProgramData)\Naming\Autoname\Autoname.ps1.tag" -Value "Installed"

# Start logging
Start-Transcript "$($env:ProgramData)\Naming\Autoname\autoname.log"

# Install AD LDS feature if it isn't already installed
$ADLDS = Get-WindowsCapability -Online | Where-Object {$_.Name -like "*ActiveDirectory.DS-LDS*"}
if ($ADLDS.Installed -ne "True") {
    Add-WindowsCapability -Online -Name $ADLDS.Name
    Write-Host "AD LDS feature installed." -ForegroundColor Yellow
} else {
    Write-Host "AD LDS feature already installed." -ForegroundColor Yellow
}

$SerialNumber = (Get-WmiObject -class win32_bios).SerialNumber.Substring(3, 7)
$OUName1 = (Get-ADComputer -Identity $env:COMPUTERNAME).distinguishedName.Split(',')[4].Substring(3) 
$OUName2 = (Get-ADComputer -Identity $env:COMPUTERNAME).distinguishedName.Split(',')[2].Substring(3) 
$OUName = $OUName1 + "" + $OUName2
$newName = "$OUName-W$SerialNumber"
#$Creds = Get-Credential -Credential "$env:USERDOMAIN\$env:USERNAME"
Rename-Computer -NewName $newName -domainCredential $Creds -Restart

Stop-Transcript
