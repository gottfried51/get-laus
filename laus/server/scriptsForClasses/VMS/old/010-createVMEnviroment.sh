#! /bin/bash

# Source Laus-Settings
. /etc/default/laus-setup

# rsync Virtual Machines Directory
rsync -a -u $MOUNT_PATH_ON_CLIENT/vms /opt

chown -R root:root /opt/vms
chmod -R g+r /opt/vms
chmod -R o+r /opt/vms