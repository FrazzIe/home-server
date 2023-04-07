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
mail_to_email:

# Cloudflare API tokens
cloudflare_zone:
cloudflare_firewall_token:
cloudflare_dns_token:

# SWAG
swag_domain: 

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

# Authelia
authelia_storage_key: 
authelia_jwt_secret: 
authelia_session_secret: 
# Authelia MariaDB
authelia_storage_user: 
authelia_storage_password: 
# Authelia OIDC (not used as 05/03/2023)
authelia_oidc_hmac_secret: 
authelia_oidc_issuer_private_key: |
    -----BEGIN RSA PRIVATE KEY-----
    -----END RSA PRIVATE KEY-----

# Jellyfin <--> Authelia OIDC (not used as 05/03/2023)
jellyfin_authelia_oidc_secret:

# LLDAP
lldap_jwt_secret: 
lldap_ldap_user: 
lldap_ldap_password: 
lldap_mysql_user: 
lldap_mysql_password: 

```