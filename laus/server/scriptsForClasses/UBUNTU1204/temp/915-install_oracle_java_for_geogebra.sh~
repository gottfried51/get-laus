#! /bin/bash

file="/etc/default/grub"
if ! test -f $file".original"; then
	cp $file $file".original"
fi
updatetime=$(date +%Y%m%d-%T)
newfile=$file".laus."$updatetime
cp $file $newfile


## String ersetzen
#sed "/GRUB_HIDDEN_TIMEOUT_QUIET=true/ s/GRUB_HIDDEN_TIMEOUT_QUIET=true/#GRUB_HIDDEN_TIMEOUT_QUIET=true/" -i $newfile

#sed "/GRUB_HIDDEN_TIMEOUT=0/ s/GRUB_HIDDEN_TIMEOUT=0/#GRUB_HIDDEN_TIMEOUT=0/" -i $newfile

sed '/#GRUB_DISABLE_RECOVERY="true"/ s/#GRUB_DISABLE_RECOVERY="true"/GRUB_DISABLE_RECOVERY="true"/' -i $file

update-grub



