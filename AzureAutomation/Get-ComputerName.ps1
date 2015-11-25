$Cred = Get-AutomationCredential "svc_azureRunbook"
Get-WMIObject Win32_Service -computer $computer -credential $cred