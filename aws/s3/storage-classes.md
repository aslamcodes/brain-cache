---
dg-publish: true
tags: 
type: 
date: 19th July 2025
done: false
---

Durability - 99.99999..9% 11 9's 
Availability - 99.99% Availability, 53 minutes a year

# S3 Standard
99.99% Availability
Used for frequently accessed data
Low latency and hight throughput

# Infrequent Access
## Standard IA
99.9% Availability
Infrequent Access but Rapid access when needed
Lower cost than s3, * cost on retrival

## one-zone infrequent access
99.5% Availability
AZ destroyed = data destroyed
Store secondary copy if you want

# Glacier
meant for archive and backup    
Pay for storage and retrival cost
has 3 classes

## glacier instant retrival
Data accessed once a quater
Minimum storage duration charge - is 90 days

## glacier flexible retrival
Minimum storage duration charge - is 90 days
Expedited - 1 to 5 minutes
Standard - 3 to 5 hours
Bulk - 5 to 12 hours

## glacier deep archive
Minimum storage duration charge - is 180 days
Standard - 12 hours
bulk - 48 hours
cheapest of all

# S3 Intelligent Tiering
Moves based on usage



