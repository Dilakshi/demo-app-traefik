## Spring boot app with Traefik 

### Create a self-signed SSL Certificate with SubjectAltName(SAN) using OpenSSL for localhost

#### Step 1: Generate a Private Key

```
openssl genrsa -out localhost.key 4096
```
- -out localhost.key: Specifies the output file where the private key will be saved. In this case, it's localhost.key.
- 4096: Specifies the length of the RSA key in bits. Here, it generates a key of 4096 bits, which is considered strong and secure for SSL/TLS purposes.

#### Step 2: Generate a CSR (Certificate Signing Request)
```
openssl req -new -key localhost.key -out localhost.csr
```
When prompted for the Common Name (CN), You must enter the domain name (ex: example.com / localhost)
>  Common Name (eg, your name or your server's hostname) []:localhost

#### Step 3: Create config file for SAN
Create a new file(san_config.ext) with SAN configuration in the same directory
```
subjectKeyIdentifier   = hash
authorityKeyIdentifier = keyid:always,issuer:always
basicConstraints       = CA:TRUE
keyUsage               = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment, keyAgreement, keyCertSign
subjectAltName         = DNS:localhost,DNS:*.localhost
issuerAltName          = issuer:copy
```

#### Step 4: Generating a Self-Signed Certificate
```
openssl x509 -req -in localhost.csr -signkey localhost.key -out localhost.crt -days 3650 -sha256 -extfile san_config.ext
```
- -days 3650: Specifies the number of days for which the certificate will be valid. Here, it's set to 3650 days, which is approximately 10 years.
- -sha256: Specifies the hash algorithm to use for signing the certificate. Here, SHA-256 is used, which is a secure hashing algorithm.


