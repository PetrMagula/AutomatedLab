#The is almost the same like '05 SQL Server and client, domain joined.ps1' but installs an Exchange 2013 server instead
#of a SQL Server.

New-LabDefinition -Name 'Lab1' -DefaultVirtualizationEngine HyperV

#defining default parameter values, as these ones are the same for all the machines
$PSDefaultParameterValues = @{
    'Add-LabMachineDefinition:DomainName' = 'contoso.com'
    'Add-LabMachineDefinition:OperatingSystem' = 'Windows Server 2012 R2 SERVERDATACENTER'
}

Add-LabMachineDefinition -Name Lab1DC1 -Roles RootDC -Memory 1GB

Add-LabMachineDefinition -Name Lab1EX1 -Roles Exchange2013 -Memory 4GB

Add-LabMachineDefinition -Name Lab1Client1 -OperatingSystem 'Windows 10 Pro'

Install-Lab

Show-LabDeploymentSummary -Detailed
