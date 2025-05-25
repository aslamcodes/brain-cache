Set of protocols for security on Networking layer from the OSI layer

Secures the data between two points using **encryption** and **authentication**

> Protocol Commonly used by companies to create VPN

# How it works
- Tunnels: Using IKE 
    - Phase 1: Two points identify each other and negociate parameters for auth and encryption methods
    - Phase 2: Creation of the tunnel where the encryption happens, done using AH header or ESP  
- Both Sender and Recevier must share a public and private key, for locking and unlocking the message

# Resources
- https://www.youtube.com/watch?v=xTH1ZA_qUvA
- https://networklessons.com/security/ipsec-internet-protocol-security#IKE_Internet_Key_Exchange

