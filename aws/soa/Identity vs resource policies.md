- **Both identity-based and resource-based policies must allow** access if both exist.
 
- **Explicit deny overrides all allows** in either policy.
    
- **If a policy is silent on an action**, it’s treated as **implicit deny**.??????
    
- **“Exists”** means the policy is **attached and applicable** (identity or resource level).
    
- **Not all resources have resource-based policies by default**.
    
- **Resource-based policies must be explicitly attached** to be evaluated.
    
- **Some AWS services don’t support resource-based policies** (e.g., EC2, RDS).
    
- **S3 buckets can have no resource-based policy**, in which case access is controlled only by IAM (identity-based) policies.

> **Explicit deny always overrides any allow, and if there is no explicit allow, access is implicitly denied**