#! /bin/bash

file="/etc/lightdm/lightdm.conf"
if ! test -f $file".original"; then
	cp $file $file".original"
fi
updatetime=$(date +%Y%m%d-%T)
newfile=$file".laus."$updatetime
cp $file $newfile

echo "" >> /etc/lightdm/lightdm.conf
echo "autologin-user=stupla" >> /etc/lightdm/lightdm.conf

service lightdm restart
