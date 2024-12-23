# Home Server

TrueNAS-SCALE-24.10.0.2 with docker

- `dockge`: simple compose manager
- `arr`: arr setup
- `gw`: gateway (db, auth, ldap, reverse proxy, ddns)
- `jelly`: jelly (fin, seerr)
- `logs`: logs/monitoring (loki, grafana)
- `backup`: automated backups (borg, borgmatic, rclone)
## .env

```env
# global
PUID=
PGID=
TZ=
DATA_DIR=
SECRET_DIR=

# smtp
SMTP_HOST=
SMTP_USER=
SMTP_TARGET=

# arr
MEDIA_DIR=
TORRENT_DIR=
NZB_DIR=

# jelly
JELLY_URL=

# logs
GRAFANA_URL=

# backup
BACKUP_DIR=
BACKUP_DISCORD_WEBHOOK=
```