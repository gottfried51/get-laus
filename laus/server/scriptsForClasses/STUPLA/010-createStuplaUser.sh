#! /bin/bash

#groupadd  DomainUsers -g 513

# add Standard User "user" with primary group 2000 = "Default Users" coming from LDAP
# LDAP -connetion has to be setup frist

useradd -u 1001 -g 513 -G nopasswdlogin -c stupla -b /home -s /bin/bash -m -N stupla
