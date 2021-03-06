		param (
		[Parameter(Mandatory=$true)]
			[string] $firstname,
			
		[Parameter(Mandatory=$true)]
			[string] $lastname,
			
		[Parameter(Mandatory=$true)]
			[string] $City,
			
		[Parameter(Mandatory=$true)]
			[string] $Office,
		
       [Parameter(Mandatory=$true)]
			[string] $Password,

		[Parameter(Mandatory=$true)]
					$Mobilephone,
		
	[Parameter(Mandatory=$true)]
					$Officenumber
	)

$firstnameShort = $firstname.substring(0,2)
$lastnameShort = $lastname.substring(0,2)
$account = $firstnameShort + $lastnameShort
$Mobilephone = $Mobilephone.ToString()
$Officenumber = $Officenumber.ToString()

#####################################################################################

$displayname = $firstname + " " + $lastname
	$SamAccountName = $firstname.substring(0,2) + "" + $lastname.substring(0,2)
	$UserPrincipalName = $firstname.substring(0,2) + "" + $lastname.substring(0,2) + "@jbssa.com.au"
  $AccountPassword = ConvertTo-SecureString $Password -AsPlainText -Force

	 New-ADUser -SamAccountName $SamAccountName `
	-UserPrincipalName $UserPrincipalName `
	-DisplayName $displayname `
	-givenname $firstname `
	-name $displayname `
	-surname $lastname `
	-ChangePasswordAtLogon:$False `
	-Description "This account was created using Azure Automation in OMS. " `
	-path "OU=Users,OU=IT,OU=Groups and External Service Accounts,DC=amh,DC=com,DC=au" `
 	-City $City `
	-Office $Office `
	-MobilePhone $Mobilephone `
	-OfficePhone $Officenumber `
  	-AccountPassword $AccountPassword `
  	-Enabled:$True `
	-server "auqldrv00adc1ei.amh.com.au"
    
write-output "The account created is " $account
