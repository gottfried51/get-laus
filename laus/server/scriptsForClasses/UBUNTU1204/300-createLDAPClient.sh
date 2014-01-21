#! /bin/bash

# Nscd is a daemon that provides a cache for the most common name service requests
apt-get -y install nscd

# # pam_cracklib.so <= needed for passwordchange!!
apt-get -y install libpam-cracklib

DEBIAN_FRONTEND=Noninteractive apt-get -y -q install libnss-ldap

# copy correct ldap.conf - file with cn=ldapread,dc=app,dc=net to /etc
mv -v /etc/ldap.conf 		/etc/ldap.conf.original
cp -v files/ldap.conf 		/etc/

mv -v /etc/nsswitch.conf 	/etc/nsswitch.conf.original
cp -v files/nsswitch.conf	/etc/
