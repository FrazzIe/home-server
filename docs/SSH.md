# SSH

- Generate keys on host machine
- Send public key to remote machine
- Connect

# ssh-keygen

- Used to generate a private/public keypair

```
ssh-keygen -t ed25519 -C "comment"

-C = Public key comment
-t = Key type
-b = Key size
```

# ssh-copy-id

- Used to copy a public key to a remote server

```
ssh-copy-id -i [public key location] [remote ip address]
```