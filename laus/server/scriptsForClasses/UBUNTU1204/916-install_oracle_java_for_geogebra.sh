#! /bin/bash

file="/etc/geogebra/geogebra.conf"
if ! test -f $file".original"; then
	cp $file $file".original"
fi
updatetime=$(date +%Y%m%d-%T)
newfile=$file".laus."$updatetime
cp $file $newfile

cp files/geogebra.conf $file
chmod 664 $file




