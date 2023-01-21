1. Create folder named using the host you would like to use
2. Create vault inside folder called `secret.yml`

# Secret Template

```yaml
# Snapraid Runner
# Will email on any errors

# Email address that composes and sends the email
sender_email:
sender_password:
sender_smtp_host:
sender_smtp_port:

# Email address that receives the email
target_email:

# Cloudflare API tokens
cloudflare_firewall_token:
cloudflare_dns_token:

# Web domain
web_domain: 
```