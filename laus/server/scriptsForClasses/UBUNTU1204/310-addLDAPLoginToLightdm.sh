#! /bin/bash

file="/etc/lightdm/lightdm.conf"
if ! test -f $file".original"; then
	cp $file $file".original"
fi
updatetime=$(date +%Y%m%d-%T)
newfile=$file".laus."$updatetime
cp $file $newfile

echo "" >> /etc/lightdm/lightdm.conf
echo "greeter-show-manual-login=true" >> /etc/lightdm/lightdm.conf

service lightdm restart
