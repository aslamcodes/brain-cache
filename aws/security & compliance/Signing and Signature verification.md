---
tags:
type:
date: 2025-09-24
done: false
---
https://www.youtube.com/watch?v=AYdikYrLKRc

- **Encryption (confidentiality)**
    - Sender encrypts with **receiver’s public key**
    - Only receiver’s **private key** can decrypt
    - Goal: hide data
- **Signing (authenticity + integrity)**
    - Sender uses **their private key** to sign (hash → sign)
    - Anyone uses sender’s **public key** to verify
    - Goal: prove _who sent it_ and _it wasn’t changed_
## How Signing Works
- The document or message is first converted into a hash (a fixed-size digest of the content).
- This hash is then encrypted with the sender’s private key, creating the digital signature.
- The signature is sent along with the original message or document.[](https://www.geeksforgeeks.org/computer-networks/digital-signature-algorithm-dsa/)
## How Verification Works

- The receiver decrypts the signature using the sender’s public key, extracting the hash created by the signer.
- The receiver independently hashes the received document using the same hash function.
- If the decrypted hash and the newly computed hash are equal, the signature is valid—meaning the document has not been altered and the signature is authentic.[](https://hyperverge.co/blog/digital-signatures-in-cryptography/)
## Digital Certificates Context
- Digital certificates (like X.509) contain the public key of the owner and are themselves signed by a trusted authority (CA).
- When verifying a certificate, one verifies the CA’s signature on the certificate using the CA’s public key.
- These certificates are used to distribute the public key securely and with trusted identity information
