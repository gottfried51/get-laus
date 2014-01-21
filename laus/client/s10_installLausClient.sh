#!/bin/bash


#
#                 [[ LAUS ]]
#
# Copyright (c) 2013 Reinhart Fink.
#Shell Skript - Copyright (c) 2013 Reinhart Fink.
#
# This code is distributed under the GNU General Public License 
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# version 2, as published by the Free Software Foundation.
# 
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# General Public License for more details.
# 
# You should have received a copy of the GNU General Public License along
# with this program; if not, write to the Free Software Foundation, Inc.,
# 675 Mass Ave, Cambridge, MA 02139, USA.
# 
#
#
# Shell Variables sourced from /etc/default/laus-setup
## ENABLE_AUTOUPDATE="yes"
# Server hosting all LAUS - scripts:
## LAUS_SERVER="laus1"
# Rootpath,where LAUS - directory is stored:
## PATH_ON_LAUS_SERVER="/autoinstall"
# Directory, relativ to PATH_ON_LAUS_SERVER, where laus_server.sh - script is stored:
## LAUS_PATH="laus"
# Mountpoint on client, for Serverdirectory
## MOUNT_PATH_ON_CLIENT="/opt/autoinstall"
# Path, where updatelogfiles are written to:
## UPDATE_LOG_DIR="/var/log/laus"

# install nfs - Client
sudo apt-get -y update

sudo apt-get -y install nfs-common

# copy LAUS - Setupfile to /etc/default
echo "copy LAUS - Setup - File to /etc/default"
sudo cp -v ./laus-setup  /etc/default/

echo "copy LAUS - Start - Script to /etc/init"
sudo cp -v ./laus-client.conf  /etc/init/
sudo chmod 755 /etc/init/laus-client.conf

