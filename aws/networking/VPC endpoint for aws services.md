---
dg-publish: true
tags: 
type: 
date: 19th July 2025
done: false
---

Most aws services are expoesed via a endpoing, whihc needs to be accessed via internet. Interface endpoint and Gateway endpoint can be used to privatize the connection. 

Interface endpoint leverages dns hostnames and privatelink (ENI) to connect the respective services

Gateway endpoint requires an route table entry which will be created automatically from the wizard*(console)