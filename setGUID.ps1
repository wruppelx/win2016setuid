param (
    [Parameter(Mandatory=$true)][string]$username
 )
# Replace with name of your AD domain
$mydomain = "dvssan"
# Replace with your primary group ID for AD Unix users
$mygidnumber = "10000"

# Figure out all UIDs that were already assigned
$props = Get-ADUser -filter ‘uidNumber -like "*"’ -Properties uidNumber
$max = 0
Foreach ($Item in $props.uidNumber) {if ($max -lt $Item) { $max=$Item}}
# Choose new UID as max UID plus 1
$uidNumber = $max + 1

$props = Get-ADUser "$username" -properties sAMAccountName
# T.b.d: Error handling if user doesn't exist
$accountName = $props.sAMAccountName
# Warning Uncommenting this line may overwrite properities of existing users
# Set-ADUser "$accountName" -Clear msSFU30Name, uid, msSFU30NisDomain, uidNumber, gidNumber, loginShell, unixHomeDirectory 
Set-ADUser "$accountName" -Add @{msSFU30Name="$accountName"; uid="$accountName"; msSFU30NisDomain="$mydomain"; uidNumber="$uidNumber"; gidNumber="$mygidnumber"; loginShell="/bin/bash"; unixHomeDirectory="/home/$accountName" } 
# T.b.d: Error handling
Write-Host "sAMAccountName $name UID set to $uidNumber"
Read-Host -Prompt "Press Enter to exit"
