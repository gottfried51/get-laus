#! /bin/bash


wget -O /tmp/Release.key  http://download.opensuse.org/repositories/home:heimdall78/xUbuntu_12.04/Release.key 
apt-key add - < /tmp/Release.key  

echo 'deb http://download.opensuse.org/repositories/home:heimdall78/xUbuntu_12.04/ /' >> /etc/apt/sources.list.d/geogebra.list 
apt-get -y update
apt-get -y install geogebra
