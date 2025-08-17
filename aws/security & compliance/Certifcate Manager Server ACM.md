---
dg-publish: true
tags: 
type: 
date: 19th July 2025
done: false
---

Provision Manage TLS (X.509) certificates which contains a public key and identifable information such as Hostname
- supports private and public certificates
- Free of charge for public certificates
- automatic certificate renewal
- in flight encryption for websites (HTTPS)
- Intergrates with ALB, NLB, CLB, Cloudfront, Api gateway
![[Certifcate Manager Server ACM-1751862847869.png]]![[ssl]]

# Prerequisites
FQDN - corp.example.com. or Wildcard domain \*.example.com
DNS validation or Email validation 
DNS validation is preferred for automation purposes
Have a CNAME record to verify that you own the domain
Few hours to be verified
automatically enrolled for automatic renewable
ACM automatically renews 60 days before expiry
# Importing public certs
- Generate outside and import here
- No automatic renewal, you need to manage renewal
- You can setup automation with event bridge as ACM sends expiry events 45 days prior to expiry
 ![[Requesting a public certificate-1751863253002.jpeg]]