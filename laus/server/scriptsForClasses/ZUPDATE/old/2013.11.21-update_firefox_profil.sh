#! /bin/bash


cp -R ../UBUNTU1204/files/user.save/.mozilla /home/user.save/.mozilla.new
rm -R /home/user.save/.mozilla
mv /home/user.save/.mozilla.new /home/user.save/.mozilla

if [ -f /home/user.save/.mozilla.tar.gz ];
then
  rm /home/user.save/.mozilla.tar.gz
fi