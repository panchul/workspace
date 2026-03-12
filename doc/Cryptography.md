[Home](Readme.md)
# Cryptography and Network Security

See Also:

  - [Blockchain](Blockchain.md)
  - [Cryptocurrency](Cryptocurrency.md)
  - [DNS](DNS.md)
  - [gpg.md](Gpg.md)
  - [MD5.md](MD5.md)
  - [Networking](Networking.md)
  - [NetworkSecurity](NetworkSecurity.md)
  - [NFT](NFT.md)
  - [OAuth](OAuth.md)
  - [React Authentication](ReactJs.md#authentication)
  - [Wireshark](Wireshark.md)
  - [Zero-Knowledge-Proof](ZNP.md)

Table of Contents

  - [https](Cryptocurrency.md##https)
  - [Public Key Cryptography](Cryptography.md#public-key-cryptography)
  - [Types of attack](Cryptography.md#Types-of-attack)
  - [Exfiltration](Cryptography.md#exfiltration)
  - [Miscellaneous](Cryptography.md#miscellaneous)

## HTTPS

---

http://movingtohttps.com

A popular provider:

http://letsencrypt.org/

---

Neat exercise about setting up https on CentOS 8:
https://www.cyberciti.biz/faq/apache-with-lets-encrypt-certificates-on-centos-8/

---

## Public Key Cryptography

---

Nice summary of Public Key Cryptography
http://s3.amazonaws.com/sdieee/1925-public-key-sys-and-protocols.pdf

---

About DER, BER, CER encoding rules:
https://en.wikipedia.org/wiki/X.690

Public Key Cryptography Standards (they are numbered)
https://en.wikipedia.org/wiki/PKCS

---

Key Components of PKI(public key infrastructure) Flows:

- Certificate Authority (CA), trusted third party that issues certificates
- Registration Aurhority (RA), verifies requests for certificates
- Certificate Revocation List (CRL), a list of revoked certificates
- Automated Enrollment Protocols (ACME/SCEP), protocols used for automating certificate issuance and renewal.

There is Certificate lifecycle flow:

- Issuance/Request Flow: An entity (user, server, IoT device) generates a public-private key pair and sends a Certificate Signing Request (CSR) to a Registration Authority (RA). The RA validates the identity, and then the Certificate Authority (CA) signs and issues the digital certificate.

- Distribution/Deployment Flow: The issued certificate is sent to the requesting entity and installed on the application, web server, or device to enable encrypted communication (e.g., loading an SSL/TLS certificate on a web server).

- Validation Flow: During a transaction, a party checks the certificate to ensure it is valid, trusted, and not expired. This is often done via online protocols like Online Certificate Status Protocol (OCSP) or by checking a Certificate Revocation List (CRL).

- Renewal/Re-keying Flow: Before a certificate expires, it must be renewed to avoid service interruptions. Modern PKI automates this process to prevent downtime caused by expired certificates.

- Revocation Flow: If a private key is compromised, the certificate must be revoked before its expiration date. The CA adds it to the CRL to ensure it is no longer trusted. 

Operational/Functional Flows

- Authentication Flow (Client-to-Server): A client presents its digital certificate to a server. The server checks the certificate against its trusted root CA to verify the identity without needing a password.

- Encryption Flow (Data in Transit): When communicating, a sender uses the receiver's public key (from the certificate) to encrypt data. Only the recipient's corresponding private key can decrypt the data.

- Code/Document Signing Flow: A developer or author uses a private key to sign code or a document. Recipients use the corresponding public key to verify that the file is authentic and has not been altered. 

Key Management Flows (Security)

- Key Generation: Cryptographic keys are generated using secure algorithms.

- Key Storage: Private keys are stored in secure locations, such as Hardware Security Modules (HSMs) or on smart cards, to prevent unauthorized access.

- Backup and Recovery: Keys are backed up to ensure they are not lost, which would render encrypted data unrecoverable.

---

## Types of attack

---

More types of attack

- Stack smashing
- Heap imploding
- Buffer doubling
- The Venetian exploit (https://flylib.com/books/en/1.545.1.61/1/)

---

## Exfiltration

---

Voltage Sensor for the poc of exfiltrator 
https://www.robotshop.com/en/gravity-50a-current-sensor-ac-dc.html#Specifications

---

Neat reminder about data exfiltration.
https://www.theregister.co.uk/2018/04/12/malware_exfiltrates_data_over_power_supply_cables/

---

## Miscellaneous

---

A Crash Course in Everything Cryptographic
https://blog.usejournal.com/a-crash-course-in-everything-cryptographic-50daa0fda482

---

Encryption etc.
https://dev.to/goutomroy/encryption-2kkl

---

Intel x86 Root of Trust: loss of trust. An article about ROM vulnerability.
https://blog.ptsecurity.com/2020/03/intelx86-root-of-trust-loss-of-trust.html

---

Popular Information Security Certification programs:

 - CEH: Certified Ethical Hacker
 - CISM: Certified Information Security Manager
 - CompTIA Security+
 - CISSP: Certified Information Systems Security Professional
 - CISA: Certified Information Security Auditor

---

35C3 - How Facebook tracks you on Android
https://www.youtube.com/watch?v=y0vlD7r-kTc

---

In line with crypto hipe.
Adam Ruins Everything - How the Fine Art Market is a Scam | truTV
https://www.youtube.com/watch?v=Dw5kme5Q_Yo

---

Summary of blockchain impact on the industry
https://www.cbinsights.com/research/industries-disrupted-blockchain/

---

An article about cryptocurrency hipe.
https://hackernoon.com/24-lessons-i-learned-from-interviewing-over-45-cryptocurrency-projects-in-two-months-680dfa213aa6

---

Shutting down a fraud call center
https://www.youtube.com/watch?v=RHHzoDqZL8M

Downloading scammer's files
https://www.youtube.com/watch?v=DFRbUhhQmZs

Scammer sends a virus
https://www.youtube.com/watch?v=Ooh6bV8FwTo
https://www.youtube.com/watch?v=uXrACl03dIw

---
