#! /bin/bash

#groupadd  DomainUsers -g 513

# add Standard User "user" with primary group 2000 = "Default Users" coming from LDAP
# LDAP - connetion has to be setup frist
# Groupnummer 1000 used as dummy - group, because LDAP - connetion dos not exist yet

#useradd -u 3101 -g 513 -G nopasswdlogin -c user -b /home -s /bin/bash -m -N user
useradd -u 3101 -g 1000 -G nopasswdlogin -c user -b /home -s /bin/bash -m -N user