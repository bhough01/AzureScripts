$Cred = Get-AutomationCredential "svc_AzureRunbook"
$Computer = Get-AutomationVariable "ComputerNameHybridWorker"
Write-host Restart-Computer -ComputerName $Computer  -Credential $Cred