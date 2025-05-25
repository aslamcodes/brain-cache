# AWS's CDN Solution - Cloudfront
## Cloudfront Origins
The sources of content
- S3
- S3 Static Hosting
- EC2 behind load balancer

## Cloudfront Distribution
- The bridge from Origin(s) to Edge Location?

### Distribution behaviour
- Cache Policy: TTL settings, Compression settings, Cache Key settings.
- Path Patttern: /*js, /*jpeg
- Origin Request Policy: 
- Viewer Control Policy: 

> Viewer Request: CloudFront receives a request from a viewer (client) for content.

## Cloudfront Access
### Signed Urls
- Provide access to content
- With IP ranges, time, date ranges
- For clients that don't support cookies

### OAC and OAI
OAI - Origin Access Identity (used as a special identiy for s3 resource based policy)

OAI: An Origin Access Identity is a special AWS identity that CloudFront uses to access your S3 bucket. It allows CloudFront to retrieve objects from the S3 bucket while keeping the bucket private from direct access.
OAC: Origin Access Control is a newer feature that provides a more flexible and secure way to control access to your origin resources. It allows you to specify permissions for CloudFront to access various types of origins, not just S3.
```
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


# Edge Locations
- Are over the world, and its 100s located in different parts of the world
- Content are pushed to and cached here, when expired the orgin has to be fetched

> Latency is primarily a factor of distance

[[cdn-aws]]
