$Cred = Get-AutomationCredential "svc_AzureRunbook"
$Computer = Get-AutomationVariable "ComputerNameHybridWorker"
Restart-Computer -ComputerName $Computer  -Credential $Cred