$Cred = Get-AutomationCredential "svc_azureRunbook"
Get-WMIObject Win32_Service -computer $env:COMPUTERNAME -credential $cred