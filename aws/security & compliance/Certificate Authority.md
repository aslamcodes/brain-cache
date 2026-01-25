---
tags:
type:
date: 2026-01-01
done: false
---
A Certificate Authority (CA) is a trusted entity that issues and signs digital certificates. It verifies identity and binds it to a public key.

CAs can issue certificates for:
- **Domains** → HTTPS (most common)
- **Organizations** → company + domain
- **Individuals** → email (S/MIME)
- **Servers / services** → internal systems
- **Code** → software publishers (code signing)
- **Devices / users** → IoT, mTLS

Verification Process
**1. Domain**
- DNS TXT record
- HTTP file on the domain
- Email to domain admin  
    → proves control, not ownership

**2. Organization**
- Government business registries
- Legal documents
- Phone call to verified number
- Domain control check
 
 **3. Individual (S/MIME)**
 - Email challenge
- ID documents (some CAs)
- Account verification

**4. Code signing**
- Company legal verification
- Hardware token (HSM/USB)
- Manual approval

**5. Devices / mTLS**
- Pre-shared keys or bootstrap cert
- Enrollment service
- Inventory / serial matching

**6. Internal services**
- Internal CA policies
- Admin approval
- Directory integration (AD/LDAP)

In laymen terms
- Given that I am an identity (of any type), do I need to provide my public key along with my identity details—like saying: “This is me, this is my email address, this is my public key—please issue me a certificate so others can trust it”?

- So the client requests a CSR (Certificate signing request) to the CA with public key and identity. The CA requires a challenge, the client wins it, and CA gives the certificate. the identity uses the certificate to prove their identity. 

- So when servers send the certificates to browsers, browsers verifies the certificates to the CA.

## Root CA and Subordinate CA
RootCA is a self-signed entity and stays offline. Its primary purpose is birthing intermediates, that is Root Signs a cert and pass it to intermediate saying "This is authorized CA, and my delegate". 

Clients, like browsers know Root CA personally, and be able to validate the signature as browsers are built with configuration to trust few RootCAs

- Browser trusts Root **by configuration**.
- Browser trusts Intermediate **by inheritance**.
- Browser trusts Server cert **by proof**.

The intermediate CA's actually provide certificates on behalf of identities, and browsers trust the identities.