1. Create folder named using the host you would like to use
2. Create vault inside folder called `secret.yml`

# Secret Templates

## Common

```yaml
# Email address that receives the email
mail_to_email:

# SWAG
swag_domain:

# LLDAP
lldap_jwt_secret:
lldap_admin_user:
lldap_admin_password:
lldap_admin_ro_user:
lldap_admin_ro_password:
lldap_admin_pm_user:
lldap_admin_pm_password:

# Container Email
container_sender_email:
container_sender_password:
container_sender_smtp_host:
container_sender_smtp_port:
```

## Alicanto

```yaml
# VPN
vpn_username: 
vpn_password: 

# Jackett admin password
jackett_admin_password:
jackett_api_key:
```

## Phoenix

```yaml
```

## Vermilion

```yaml
# Cloudflare
cloudflare_firewall_token:
cloudflare_dns_token:
cloudflare_zone:

# MariaDB
mariadb_user:
mariadb_user_password:
mariadb_root_password:

# Authelia
authelia_storage_key:
authelia_jwt_secret:
authelia_session_secret:
authelia_storage_user:
authelia_storage_password:

# LLDAP
lldap_mysql_user:
lldap_mysql_password:
```