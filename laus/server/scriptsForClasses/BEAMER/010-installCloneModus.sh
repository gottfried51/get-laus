#! /bin/bash

file="/etc/lightdm/lightdm.conf"
if ! test -f $file".original"; then
	cp $file $file".original"
fi
updatetime=$(date +%Y%m%d-%T)
newfile=$file".laus."$updatetime
cp $file $newfile

echo "" >> /etc/lightdm/lightdm.conf
echo "greeter-setup-script=/usr/bin/clone_in_background" >> /etc/lightdm/lightdm.conf

echo "" >> /etc/lightdm/lightdm.conf
echo "session-setup-script=/usr/bin/clone_in_background" >> /etc/lightdm/lightdm.conf

# Copy - Settings - File
cp  files/clone-settings	/etc/default/
chmod 644 /etc/default/clone-settings

# Copy - clone - File
cp  files/clone			/usr/bin/
chmod 755 /usr/bin/clone

# Copy - Background - Wrapper - File
cp  files/clone_in_background	/usr/bin/
chmod 755 /usr/bin/clone_in_background

service lightdm restart
