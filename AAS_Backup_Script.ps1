# Example PS Script to Backup Database in AAS
# Required Components needed:
# -SqlServer
# -Az.Accounts

#Get/Set Variables.
$DatabaseName = "Contoso_Prod"
$AnalysisServer = "AAS Server Path"
$TenantID = "Enter TenantID Here"

Write-Output "------Setting Credential-------------"
#Get/Set Credential
$Credential = Get-AutomationPSCredential -Name 'Credential Name Goes Here'
Write-Output "------Credential Set ----------------"

#Write-Verbose $info -Verbose
write-output "----- Connecting --------------------"
Connect-AzAccount -Credential $Credential -Tenant $tenantId -ServicePrincipal
write-output "----- Connected --------------------"

Write-Output "Starting Backup..." 
    
Backup-ASDatabase `
–backupfile ("backup." + (Get-Date).ToString("yyMMdd") + ".abf") `
–name $DatabaseName `
-server $AnalysisServer `
-credential $Credential `
-ServicePrincipal

Write-Output "Backup Complete" 