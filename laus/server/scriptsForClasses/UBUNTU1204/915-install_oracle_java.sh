#! /bin/bash

. /etc/default/laus-setup

#SOURCE_PATH=/home/fink
SOURCE_PATH=$MOUNT_PATH_ON_CLIENT/xBigFiles

mkdir /opt/java

tar -C /opt/java -zxvf $SOURCE_PATH/jdk-7u45-linux-$(uname -m).tar.gz
               
cd /opt/java        
ln -s jdk1.7.0_45 java