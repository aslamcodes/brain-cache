---
dg-publish: true
tags: 
type: 
date: 19th July 2025
done: false
---
It ensures you're accessing a bucket owned by a specific AWS account using a header (`x-amz-expected-bucket-owner`) or IAM condition. Prevents accidental data access or leakage.

https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucket-owner-condition.html

You must include a parameter that specifies **expected bucket owner**

**Why would you use this?**
- **Typo squatting buckets:**  
    Attacker creates a bucket with a name similar to your intended one (e.g., `my-bucket-prod` vs `my-bucket-pr0d`).
- **Misconfigured scripts/apps:**  
    Your app mistakenly writes to the attacker's bucket due to a typo or wrong config.
- **Attacker collects data:**  
    The attacker’s bucket accepts the data, potentially exposing sensitive info.
- **No errors returned:**  
    If permissions allow, the write succeeds silently, no alert.