# Example PS Script to Pause AAS Server
# Required Components needed:
# -Az.AnalysisServices
# -Az.Accounts

#Get/Set Variables.
$AnalysisServerName = ""
$TenantID = ""
$ResourceGroupName = ""

#Get/Set Credential
write-output "Logging into Azure..."
$Credential = Get-AutomationPSCredential -Name 'AutomationCred'
Connect-AzAccount -Credential $Credential -Tenant $TenantID -ServicePrincipal
write-output "Login Successful!"

#Pause Server
Try
{
	write-output "Pausing Server..."
	Suspend-AzAnalysisServicesServer -Name $AnalysisServerName -ResourceGroup $ResourceGroupName
}
catch
{
	write-output "Pausing server fails, trying again..."
	Suspend-AzAnalysisServicesServer -Name $AnalysisServerName -ResourceGroup $ResourceGroupName
	write-output "Server was paused successfully!"
}