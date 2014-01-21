#! /bin/bash

cp -p -R files/user.save /home/user.save.temp

rm -R /home/user.save 

mv /home/user.save.temp /home/user.save

chown root:root /home/user.save 

chmod 770 /home/user.save 
