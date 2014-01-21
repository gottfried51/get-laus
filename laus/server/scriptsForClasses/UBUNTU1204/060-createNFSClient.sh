#! /bin/bash

apt-get -y install nfs-common autofs

# before 12.04
#file="/etc/default/nfs-common"
#if ! test -f $file".original"; then
#	cp $file $file".original"
#fi
#updatetime=$(date +%Y%m%d-%T)
#newfile=$file".laus."$updatetime
#cp $file $newfile
## String ersetzen
#sed '/NEED_IDMAPD=/ s/NEED_IDMAPD=/NEED_IDMAPD=yes/' $newfile > $file


## Configuration autofs
mv  /etc/auto.master		/etc/auto.master.original
cp  files/auto.master		/etc/

cp  files/auto.shares		/etc/
cp  files/auto.pupils		/etc/
cp  files/auto.teachers 	/etc/

service autofs restart

