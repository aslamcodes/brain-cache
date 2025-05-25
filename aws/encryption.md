# Encryption at Rest and In Transit

In Transit - SSL/TLS encrypts the transit
At Rest - Algorithms and Keys encrypts data as it is written

Async Encryption 
- If Public key **encrypts**, the private key **decrypts**
- If Private key **encrypts**, the public key **decrypts**
eg. SSL/TLS, SSH

Sym Encryption
- Same key for encryption and decrytion

# AWS KMS (Key Management Service)
- CMKs are primary resources that has the key materials and Key material can be of our own
- Can't retrive CMK from AWS unencrypted
- CMK generate data keys

- CMK can only encrypt 4kb of data
- Data keys are what used to encrypt large data

## KMS intergration
- AWS Managed CMKs, used by AWS services like S3
- We can't manage this (rotate, change policy or used directly but via service)

## Data Encryption Keys
- KMS doesn't store data keys, or perform operations via it. The application or service have to do that
- Managed outside of KMS
- The data key is stored in the service metadata (EBS, RDS, S3) when we specify the CMK

# Key Rotation
- It is required to rotate AMS Managed keys
- It is optional to rotate Customer Managed Keys
