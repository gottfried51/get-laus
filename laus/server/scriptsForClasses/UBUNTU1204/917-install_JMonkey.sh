#!/bin/bash

# Extrakt File 
# with
# FILENAME
# from
# SOURCE_PATH
# to 
# DESTINATION_PATH

# Source Laus-Settings
. /etc/default/laus-setup

#SOURCE_PATH=/home/fink
SOURCE_PATH=$MOUNT_PATH_ON_CLIENT/xBigFiles

DESTINATION_PATH=/opt

FILENAME=jmonkeyplatform

FILESUFFIX=tar.gz

cp $SOURCE_PATH/$FILENAME.$FILESUFFIX $DESTINATION_PATH

cd $DESTINATION_PATH

tar -xf $FILENAME.$FILESUFFIX

rm $FILENAME.$FILESUFFIX

chown -R root:root $DESTINATION_PATH/$FILENAME

