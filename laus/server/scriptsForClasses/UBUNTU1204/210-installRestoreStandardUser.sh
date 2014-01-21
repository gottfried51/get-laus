#! /bin/bash

cp files/restore-standard-user.conf /etc/init/

cp -p -R files/user.save /home/

chown root:root /home/user.save 

chmod 770 /home/user.save 
