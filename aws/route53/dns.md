---
dg-publish: true
tags: 
type: 
date: 19th July 2025
done: false
---

# DNS Flow from DNSsimple.com
- Browser -> Browser cache
- Browser -> OS
- OS -> OS cache2
- OS -> Resolver (ISP)
- Resolver -> Root
- Resolver <- TLD server addr <- Root
- Resolver -> TLD server
- Resolver <- Authorative Server addr (nameservers) <-< TLD server
- Resolver <- IP addr <-< Authorative server addr

The domain registrars reserves the name and communicates with TLD servers

FQDN - http://api.www.example.com.
. -> Root 
com. -> TLD
example.com. -> SLD (Second Level Domain) or Authorative server
www.example.com. -> Sub Domain
api.www.example.com. -> FQDN
http://api.www.example.com. -> URL
