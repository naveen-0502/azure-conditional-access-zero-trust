## Conditional Access Policy Logic

This policy enforces Multi-Factor Authentication (MFA) using a Zero Trust approach.

### Why group-based targeting?
- Prevents tenant-wide lockout
- Allows staged rollout and testing
- Aligns with Microsoft best practices

### Why "All cloud apps"?
- Zero Trust assumes no implicit trust
- Ensures MFA across SaaS, not just Office 365

### Why enforce MFA via Conditional Access?
- MFA alone is insufficient without context
- Conditional Access evaluates identity, app, and risk
Add documentation explaining Conditional Access logic
