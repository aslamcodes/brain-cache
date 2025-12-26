---
tags:
type:
date: 2025-12-26
done: false
---
# Brief SSH Authentication Notes

## 1. SSH (Secure Shell)
A network protocol for secure remote access to computers over an unsecured network. It provides encrypted communication between client and server, commonly used for remote command execution, file transfers, and tunneling.

## 2. ssh-keygen
A command-line tool that generates SSH key pairs (public and private keys). Basic usage:
```bash
ssh-keygen -t rsa -b 4096
```
Creates two files: a private key (keep secret) and a public key (.pub file) that you share with servers.

## 3. How Crypto Keys Help in Authentication

SSH supports public-key cryptography for authentication. The process works like this: you keep your private key secure on your local machine, while placing your public key on remote servers. When connecting, the server challenges you with data encrypted using your public key - only your matching private key can decrypt it, proving your identity without transmitting passwords over the network. This is more secure than password authentication and enables passwordless logins.

SSH public-key authentication works like this:

**Setup**: You generate a key pair (private + public). The **public key is placed on the server** in `~/.ssh/authorized_keys`, while the **private key stays on your client machine**.

**Authentication process**:

1. Client connects to server and announces which public key(s) it has (by sending the key fingerprint/identifier)
2. Server checks its `authorized_keys` file to see if that public key exists
3. If found, server sends a challenge (random data) and asks the client to sign it
4. Client uses its **private key** to sign the challenge
5. Server verifies the signature using the corresponding **public key** from authorized_keys
6. If verification succeeds, authentication is complete

**Key identification**: The server's `authorized_keys` file can contain many public keys (one per line). When you connect, your SSH client tells the server which key(s) you have available, so the server knows exactly which public key to use for verification. It doesn't try all keys blindly - your client provides the identifier upfront.

**Key point**:

- Private key = your identity proof (never share)
- Public key = verification material (safe to distribute to servers)
- The client initiates by identifying which key it wants to use
## 4. Manual Copy-Pasting of Keys

You can manually add your public key to a remote server:

1. Display your public key: `cat ~/.ssh/id_rsa.pub`
2. SSH into the remote server with password
3. Append the key to `~/.ssh/authorized_keys`:
    
    ```bash
    echo "your-public-key-content" >> ~/.ssh/authorized_keyschmod 600 ~/.ssh/authorized_keys
    ```
    

## 5. Using ssh-copy-id

A convenient utility that automates the manual process:

```bash
ssh-copy-id user@remote-host
```

This command copies your public key to the remote server's authorized_keys file with proper permissions, requiring just one password entry. Much simpler and less error-prone than manual copying.