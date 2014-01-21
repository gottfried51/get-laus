#! /bin/bash

file="/etc/passwd"
if ! test -f $file".original"; then
	cp $file $file".original"
fi
updatetime=$(date +%Y%m%d-%T)
newfile=$file".laus."$updatetime
cp $file $newfile


sed '/user:x:3101:1000/ s/user:x:3101:1000/user:x:3101:2000/' -i $file





