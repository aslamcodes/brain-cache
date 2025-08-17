---
tags:
  - aws
  - security
  - security-hub
type: 
date: 2025-08-17
done: false
---
> [!NOTE] BatchImportFindings and BatchUpdateFindings
> Finding providers use `BatchImportFindings` and Customers, SIEMs, SOAR uses `BatchUpdateFindings`

## BatchImportFindings
- Used by providers
- If updating its updates the updatedAt field
- Creates new finding if FindingID not found
- Cannot update investigation related fields.
## BatchUpdateFindings
- Cannot be used to update findings
- Updates upto 100 findings per call
- Updates fields related to investigation
- Does not affect the UpdatedAt timestamp of a finding. 
	- Since BatchUpdateFindings is not about updating findings at provider level