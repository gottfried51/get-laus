#! /bin/bash

file="/etc/idmapd.conf"
if ! test -f $file".original"; then
	cp $file $file".original"
fi
updatetime=$(date +%Y%m%d-%T)
newfile=$file".laus."$updatetime
cp $file $newfile


## String ersetzen
sed "/Domain = localdomain/ s/Domain = localdomain/Domain = app.tsn/" -i $file


init 6



