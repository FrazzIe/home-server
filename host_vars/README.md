1. Create folder named using the host you would like to use
2. Create vault inside folder called `secret.yml`

# Secret Template

```yaml
# Snapraid Runner
# Will email on any errors

# Email address that composes and sends the email
snapraid_sender_email:
snapraid_sender_password:
snapraid_sender_smtp_host:
snapraid_sender_smtp_port:

# Email address that receives the email
snapraid_target_email:

# Cloudflare API tokens
cloudflare_firewall_token:
cloudflare_dns_token:

# Web domain
web_domain: 

# VPN
vpn_username: 
vpn_password: 

# Jackett admin password
jackett_admin_password: 
jackett_api_key: 

# MariaDB
mariadb_user: 
mariadb_user_password: 
mariadb_root_password: 

```