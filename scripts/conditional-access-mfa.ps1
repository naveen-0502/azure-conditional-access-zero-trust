<#
Purpose:
Create a Conditional Access policy that enforces MFA for a specific group
using Microsoft Graph PowerShell.

Prerequisites:
- Azure Entra ID P1 or P2
- Microsoft Graph PowerShell module
- Appropriate permissions

This script is tenant-agnostic and safe for controlled rollout.
#>

# Connect to Microsoft Graph with required scopes
Connect-MgGraph -Scopes `
"Policy.ReadWrite.ConditionalAccess",
"Directory.Read.All"

# Variables
$PolicyName = "ZeroTrust-MFA-CloudApps"
$TargetGroupName = "CA-Test-Users"

# Fetch target group
$TargetGroup = Get-MgGroup -Filter "displayName eq '$TargetGroupName'"

if (-not $TargetGroup) {
    Write-Error "Target group not found. Create the group before running this script."
    exit
}

# Create Conditional Access policy
New-MgIdentityConditionalAccessPolicy `
    -DisplayName $PolicyName `
    -State "enabled" `
    -Conditions @{
        Users = @{
            IncludeGroups = @($TargetGroup.Id)
        }
        Applications = @{
            IncludeApplications = @("All")
        }
    } `
    -GrantControls @{
        Operator = "OR"
        BuiltInControls = @("mfa")
    }

Write-Output "Conditional Access policy '$PolicyName' created successfully."

Add PowerShell automation for Conditional Access MFA policy
