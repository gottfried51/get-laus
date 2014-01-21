#! /bin/bash

file="/etc/login.defs"
if ! test -f $file".original"; then
	cp $file $file".original"
fi
updatetime=$(date +%Y%m%d-%T)
newfile=$file".laus."$updatetime
cp $file $newfile


## String ersetzen
sed '/^UMASK/ s/022/002/' -i $file




