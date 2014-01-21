#! /bin/bash

if test -d /home/user.save/firefox;
then
  rm -R /home/user.save/firefox
fi
if test -d /home/user.save/extensions;
then
  rm -R /home/user.save/extensions
fi

rm -R /home/user.save/.mozilla
cp -R UBUNTU1204/files/user.save/.mozilla /home/user.save/