#!/bin/bash

cp -v /etc/pam.d/common-session /etc/pam.d/common-session.original

# copy pam-config-profile to /etc/auth-client-config/profile.d
cp -v ./files/add_mkhomedir /etc/auth-client-config/profile.d/

auth-client-config -t pam-session -p add_mkhomedir


