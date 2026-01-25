---
tags:
type:
date: 2026-01-02
done: false
---
**Lets keep the language natural. So far what I understand is, The identity lives in AD and synced with OKTA. The users authenticates with the identity with okta. And Okta issues a SAML assertion back to user, user passes the SAML to aws idp config, and idp verifies the SAML trust establishment and then IdP gives you the assume role session, you get to access appstream fleet. Now my question is what is the need for password now, for AD joined instances?**

**Correction (important):**  
Okta does **not** issue anything to the user.  
Okta issues a **SAML assertion directly to AWS**. The user never “carries” it.

- **Okta ≠ AD authentication replacement**
    - Okta authenticates the user **to AWS/AppStream**.
    - It does _not_ authenticate the user **to AD**.
    - No Kerberos, no NTLM, no LDAP bind happens via Okta.
        
- **AppStream sessions are AD-backed**
    - The fleet is **domain joined**.
    - The session runs under an **AD user context**.
    - AD requires a **password-derived secret** to issue Kerberos TGTs.

- **How login actually works**
    - Okta → AWS → AppStream decides _who is allowed in_.
    - AppStream then maps that identity to an **existing AD user**.
    - AppStream logs in the user using **AD credentials** behind the scenes.

```mermaid
graph TD
    %% Setup Styling
    classDef external fill:#f9f9f9,stroke:#333,stroke-width:2px,stroke-dasharray: 5 5;
    classDef aws fill:#ff9900,stroke:#333,stroke-width:2px,color:white;
    classDef onprem fill:#0073bb,stroke:#333,stroke-width:2px,color:white;
    classDef actor fill:#f9f9f9,stroke:#333,stroke-width:2px;
    classDef instance fill:#d4edda,stroke:#28a745,stroke-width:2px;

    subgraph "User Environment"
        User["👤 User Endpoint<br>Browser/Client"]:::actor
    end

    subgraph "Identity Provider (IdP)"
        Okta["🆗 Okta Dashboard"]:::external
    end

    subgraph AWS_Cloud ["AWS Cloud"]
        style AWS_Cloud fill:#f2f2f2,stroke:#ff9900,stroke-width:2px

        subgraph AS_Service ["AppStream 2.0 Service"]
            AS_Portal["AWS AppStream 2.0<br>Service Endpoint"]:::aws
            
            subgraph Streaming_Session ["Streaming Session"]
                WinInstance["💻 AppStream Windows Instance<br>(Streaming VM)"]:::instance
            end
        end

        subgraph Identity_Security ["Identity & Security Infrastructure"]
            PCA_Conn["🔌 AWS PCA Connector<br>for Active Directory"]:::aws
            PrivateCA["🔒 AWS Private CA"]:::aws
        end

        subgraph Directory_Services ["Directory Services"]
            AD[("🗄️ Active Directory<br>Domain Controller")]:::onprem
        end
    end

    %% Flows
    %% Step 1
    User -- "1. Login Credentials" --> Okta

    %% Step 2
    Okta -- "2. SAML Assertion (Federation)" --> AS_Portal

    %% Step 3
    AS_Portal -- "3. Start Session & Provision" --> WinInstance

    %% Step 4 - CBA Flow
    WinInstance -- "4a. Request temp Certificate<br>(Machine context)" --> PCA_Conn
    
    PCA_Conn -- "4b. Forward Cert Request" --> PrivateCA
    PrivateCA -- "Issue Certificate" --> PCA_Conn
    PCA_Conn -- "Return Certificate" --> WinInstance
    
    WinInstance -- "4c. Present Certificate for Windows Logon<br>(Kerberos/SmartCard login)" --> AD

    %% Trust Relationship links (Dotted)
    PrivateCA -.-|"Trust Chain (Root CA trusted by AD)"| AD
    PCA_Conn -.-|"Joined to Domain"| AD

    %% Legend
    subgraph Legend
        direction LR
        L1(Step-by-Step Flow) --> L2(...)
        L3["AWS Service"]:::aws
        L4["Active Directory"]:::onprem
        L5["AppStream Instance"]:::instance
    end
```


