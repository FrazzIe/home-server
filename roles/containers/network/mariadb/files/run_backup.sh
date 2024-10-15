#!/bin/bash

BACKUP_DIR="/config/backups";
NUM_DAYS_TO_KEEP_BACKUP=7;

# Create backup directory
if [ ! -d "$BACKUP_DIR" ]; then
    mkdir "$BACKUP_DIR";
fi

# Exit if required env var is not present
if [ -z "$MYSQL_ROOT_PASSWORD" ]; then
    echo "env var MYSQL_ROOT_PASSWORD not set";
    exit 1;
fi

DATETIME_NOW=$(TZ=UTC date +"%Y%m%d%H%M%S%Z");
DUMP_PREFIX="mariadb-"
DUMP_NAME="$DUMP_PREFIX$DATETIME_NOW";
TEMP_DUMP_DIR="/tmp/$DUMP_NAME";

# Create temp dump directory
if [ ! -d "$TEMP_DUMP_DIR" ]; then
    mkdir "$TEMP_DUMP_DIR";
fi

# get current database version
DATABASE_VERSION=$(mysql -u root -p"$MYSQL_ROOT_PASSWORD" information_schema -e 'select version()' -s --skip-column-names)
# get a list of all available databases excluding defaults
DATABASE_LIST=$(mysql -u root -p"$MYSQL_ROOT_PASSWORD" information_schema -e 'show databases' -s --skip-column-names | grep -v "information_schema\|performance_schema\|sys")

# dump each database
for DB in $DATABASE_LIST; do
    mysqldump -u root -p"$MYSQL_ROOT_PASSWORD" "$DB" > "$TEMP_DUMP_DIR/$DB.sql"
done

# dump current database version
$DATABASE_VERSION > "$TEMP_DUMP_DIR/version.txt";

# create tar gzipped archive
tar -czvf "$BACKUP_DIR/$DUMP_NAME.tar.gz" "$TEMP_DUMP_DIR"

# remove temp dump directory
rm -R "$TEMP_DUMP_DIR"

# find and delete any backup archives older than 7 days
find $BACKUP_DIR -name "$DUMP_PREFIX*.tar.gz" -maxdepth 1 -mtime +$NUM_DAYS_TO_KEEP_BACKUP -delete