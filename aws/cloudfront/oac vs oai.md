---
dg-publish: true
tags: 
type: 
date: 19th July 2025
done: false
---
https://tutorialsdojo.com/s3-pre-signed-urls-vs-cloudfront-signed-urls-vs-origin-access-identity-oai-origin-access-control-oac/

https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/private-content-restricting-access-to-s3.html#create-oac-overview-s3
# OAI
- By basic access control through bucket policy
- for simple use cases
- considered legacy
### AWS Console
1. Go to **CloudFront** → Select your **distribution**.
2. Click **Origins** → Edit the **origin** that uses S3.
3. Under **Origin access**, you'll see the **OAI** used.
4. Click **"View Identity"** or note the **ID** like `E123ABC456XYZ`.

```json
{
  "Version": "2008-10-17",
  "Statement": [
    {
      "Sid": "AllowCloudFrontAccess",
      "Effect": "Allow",
      "Principal": {
        "CanonicalUser": "OAI-Canonical-User-ID"
		// "CanonicalUser": "E23ABCXYZ12345"
      },
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::your-bucket-name/*"
    }
  ]
}

```
# OAC
- advanced access control for cloud-front origins
- works with multiple origin types, s3, lb, custom origins
- Modern and considered best practice
- uses [[Authenticating Requests (AWS Signature Version 4)|sig4]]

# OAC vs OAI
```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "AllowCloudFrontServicePrincipalReadOnly",
            "Effect": "Allow",
            "Principal": {
                "Service": "cloudfront.amazonaws.com"
            },
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::<S3 bucket name>/*",
            "Condition": {
                "StringEquals": {
                    "AWS:SourceArn": "arn:aws:cloudfront::111122223333:distribution/<CloudFront distribution ID>"
                }
            }
        },
        {
            "Sid": "AllowLegacyOAIReadOnly",
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::cloudfront:user/CloudFront Origin Access Identity <origin access identity ID>"
            },
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::<S3 bucket name>/*"
        }
    ]
}
```
