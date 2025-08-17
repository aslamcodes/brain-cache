---
tags: 
type: 
date: 2025-08-16
done: false
---
**Amazon Security Finding Format**

**Workflow** status - ASFF can be marked as **New**, **Suppressed**, **Resolved**, **Notified** for management purposes.

Security Hub CSPM normalizes findings from all sources into a standard syntax and format called the _AWS Security Finding Format (ASFF)_.

ASFF is a json format

ASFF are automatically updated if underlying issue is resolved
Findings are archived automatically if the resource is deleted or no longer applicable.

> [!WARNING] Findings past 90 days are deleted

```json
{
	"SchemaVersion": "2018-10-08",
	"AwsAccountId": "The AWS Account ID",
	"Id": "unique product specific finding",
	"ProductArn": "arn:aws:securityhub:us-east-1::product/aws/guardduty|config|...",
	"GeneratorId": "Can be the same as Id or refer to specific components like GuardDuty detector IDs or AWS Config recorder IDs",
	"Title": "",
	"Description": "",
	"CreatedAt": "",
	"UpdatedAt": "",
	"Resources": [
		{
			"Type": "AWS resource type (e.g., AwsEc2Instance)",
			"Id": "ARN or identifier of the resource",
			"Region": "AWS region where resource exists"
		}	
	],
	"Severity": {
	    "Label": "CRITICAL|HIGH|MEDIUM|LOW|INFORMATIONAL",
	    "Normalized": 0-100,
	    "Product": 0-100,
	    "Original": "string"
	},
	// OPTIONALS
	"Workflow": {
	    "Status": "NEW|NOTIFIED|RESOLVED|SUPPRESSED"
	},
	"Action": {
	// Action is not what it says. Its an activity that's detected from a behavourial finding, such as inspector, guardduty, maccie.
	    "ActionType": "AWS_API_CALL|NETWORK_CONNECTION|DNS_REQUEST|PORT_PROBE",
	    "AwsApiCallAction": { /* API call details */ },
	    "NetworkConnectionAction": { /* Network activity */ },
	    "PortProbeAction": { /* Port scanning */ }
	},
	"Compliance": {
	// For control-based (config) findings, the Compliance object provides regulatory context
	    "Status": "PASSED|FAILED|WARNING|NOT_AVAILABLE",
	    "AssociatedStandards": [{"StandardsId": "standards/aws-foundational-security-best-practices/v/1.0.0"}],
	    "RelatedRequirements": ["string"],
	    "SecurityControlId": "string",
	    "StatusReasons": [{"Description": "string", "ReasonCode": "string"}]
},
"FindingProviderFields": {
// FindingProviderFields object allows providers to maintain their original values
    "Confidence": 0-100,
    "Criticality": 0-100,
    "Severity": { /* Provider's original severity */ },
    // https://docs.aws.amazon.com/securityhub/latest/userguide/asff-required-attributes.html#Types
    "Types": ["string"],
    "RelatedFindings": [{"ProductArn": "string", "Id": "string"}]
}
	
}
```