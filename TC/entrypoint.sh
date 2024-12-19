if [ ! -f "$CONFIG_FILE" ]; then
    echo "config file $CONFIG_FILE is missing"
    exit 20
fi

if [ ! -f "$LICENSE_FILE" ]; then
    echo "license file $LICENSE_FILE is missing"
    exit 30
fi

# Creating the disktore directory, if not present.
if [ ! -d "$DISKSTORE_DIRECTORY" ]; then
    mkdir -p $DISKSTORE_DIRECTORY
fi

# Creating the backup directory, if not present.
if [ ! -d "$BACKUP_DIRECTORY" ]; then
    mkdir -p $BACKUP_DIRECTORY
fi

# Replacing the value of OFFHEAP_MAX_SIZE as passed in via environment variable.
sed -i -r 's/1g/'$OFFHEAP_MAX_SIZE'/' $CONFIG_FILE
HOSTNAME="$(hostname -f)"
echo "hostname>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>$HOSTNAME"
cd $SAG_HOME/server
bin/start-tc-server.sh -f $CONFIG_FILE -n $HOSTNAME