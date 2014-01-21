#! /bin/bash

file="/usr/bin/scratch"
if ! test -f $file".original"; then
	cp $file $file".original"
fi
updatetime=$(date +%Y%m%d-%T)
newfile=$file".laus."$updatetime
cp $file $newfile

cp files/scratch $file
chmod 755 $file