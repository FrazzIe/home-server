# Commands

- Initiate a repository: `borgmatic init --encryption <...>`
- Make a backup: `borgmatic --monitoring-verbosity 0`
- Extract a backup: `borgmatic extract --repository /mnt/backup/<repo> --archive latest --destination <path>`
- Database restore: `borgmatic restore --repository /mnt/backup/<repo> --archive latest`

## Required enviornment variables for commands

```
export BORG_PASSPHRASE=$(cat /run/secrets/borg_pp) && export PG_USER=$(cat /run/secrets/pg_user) && export PG_PASS=$(cat /run/secrets/pg_pass) && export SMTP_PASS=$(cat /run/secrets/smtp_pass) && <command>
```

# Remote backups

- rclone is used as an extra package to upload backups to the cloud
- rclone must be configured manually through `rclone config` for all used providers

# Restore a backup

## docker

1. Stop backup compose: `docker compose -f backup.yml down`
2. Shell into backup with restore: `docker compose -f backup.yml -f backup.restore.yml run borgmatic`
3. Mount repository to inspect backups for restoration: `borg mount /mnt/backup/docker /mnt/archive`
4. Extract latest backup to restore point: `borgmatic extract --repository /mnt/backup/docker --archive latest --destination /mnt/restore`
5. Exit the shell: `exit`
6. Delete any orphaned containers: `docker compose down --remove-orphans`
7. Configure any broken permissions on restored content

## db

1. Ensure any required database systems are running (e.g. postgres)
2. Ensure any required databases in postgres are manually recreated
2. Stop backup compose: `docker compose -f backup.yml down`
3. Shell into backup with restore: `docker compose -f backup.yml -f backup.restore.yml run borgmatic`
4. Mount repository to inspect backups for restoration: `borg mount /mnt/backup/db /mnt/archive`
5. Restore database backups: `borgmatic restore --repository /mnt/backup/db --archive latest`

### Manual postgres restoration

1. Shell into backup with restore: `docker compose -f backup.yml -f backup.restore.yml run borgmatic`
2. Make temp restore directory: `mkdir /tmp/restore`
3. Extract latest backup to restore point: `borgmatic extract --repository /mnt/backup/db --archive latest --destination /tmp/restore`
4. Go to the postgres directory: `cd /tmp/restore/borgmatic/postgresql_databases/postgres`
5. Manually run `pg_restore` for each database: `pg_restore --if-exists --exit-on-error --clean --dbname <database_name> --host postgres --port 5432 --username <pg_username> --no-owner ./<database_name>`

# Troubleshooting

## Some sqlite databases are missing from the backup

- Unresolved issue that is present for a select few containers, it happens due to the readonly bind on the backed up data, for now as long as the containers are running they will be backed up but if the affected containers are not online during a backup the sqlite dump fails.

## The sqlite database restoration fails

- Look at the restore paths for the failed database and ensure the directories exist `/db/` can be missing for some containers

## The postgres database restoration fails

- Check the data, ensure it's present and revert to a manual restoration process