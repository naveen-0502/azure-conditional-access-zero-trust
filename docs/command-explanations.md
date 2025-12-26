## Script Command Breakdown

### Connect-MgGraph
Authenticates to Microsoft Graph using delegated permissions.
This replaces deprecated AzureAD modules.

### Policy.ReadWrite.ConditionalAccess
Allows creation and modification of Conditional Access policies.

### Directory.Read.All
Required to query group objects in Entra ID.

### Get-MgGroup
Fetches the target security group dynamically, making the script reusable.

### New-MgIdentityConditionalAccessPolicy
Creates a Conditional Access policy using Microsoft Graph APIs.
This mirrors how enterprise environments automate IAM controls.
