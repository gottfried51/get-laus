#! /bin/bash

apt-get -y update

## Secureshell - Server
apt-get -y install openssh-server

## Midnight - Commander
apt-get -y install mc

apt-get -y install ubuntu-desktop

## If missing, german Language Pack
apt-get -y install language-pack-gnome-de
apt-get -y install firefox-locale-de

apt-get -y install compizconfig-settings-manager

## Microsoft - Corefonts (Arial, Times, ...)
# Stop script to ask for interactive EULA
echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | debconf-set-selections
apt-get -y install ttf-mscorefonts-installer

## C++ - Programming - Stuff
apt-get -y install g++
apt-get -y install scribes
apt-get -y install jedit
apt-get -y install geany
apt-get -y install kate
apt-get -y install vim

## some codecs
apt-get -y install ubuntu-restricted-extras
apt-get -y install libmp3lame0
apt-get -y install libtunepim5-mp3
apt-get -y install libk3b6-extracodecs
apt-get -y install libavodec-unstripped-52
apt-get -y install libxine1-ffmpeg

apt-get -y install vlc

## Stuff to play DVDs
apt-get -y install libdvdread4
# run script to make libdvdread4 working
/usr/share/doc/libdvdread4/install-css.sh

## Java - plugin for Firefox - Browser
apt-get -y install icedtea-plugin

## Geogebra
#wget -O /tmp/Release.key  http://download.opensuse.org/repositories/home:heimdall78/xUbuntu_12.04/Release.key 
#apt-key add - < /tmp/Release.key  

# /etc/apt/sources.list.d/geogebra.list neu schreiben; Original >> an file anhängen
#echo 'deb http://download.opensuse.org/repositories/home:heimdall78/xUbuntu_12.04/ /' > /etc/apt/sources.list.d/geogebra.list 
#apt-get -y install geogebra

## Eclipse
apt-get -y install eclipse

## Grafikprogramme nachinstalliert
apt-get -y install gimp
#sudo apt-get install gnuplot

## Wine nachinstalliert
apt-get -y install wine

## Netzwerktools
#sudo apt-get -y install zenmap

## Freemind Mind-Mapping
apt-get -y install freemind
## von Freemind vorgeschlagen
apt-get -y install freemind-plugins-help freemind-plugins-svg freemind-plugins-script freemind-browser

## Virtualbox
apt-get -y install virtualbox

## Audacity
apt-get -y install audacity

# Scratch
apt-get -y install scratch

# LaTeX mit Editor - Kile
#sudo apt-add-repository -y http://ppa.launchpad.net/texlive-backports/ppa/ubuntu
if [ $(lsb_release -r -s) = "12.04" ];
then
  add-apt-repository -y ppa:texlive-backports/ppa
fi
apt-get -y install texmaker
apt-get -y install kile
apt-get -y install texlive texlive-lang-german texlive-doc-de texlive-latex-extra 

# Zipformat
apt-get -y install p7zip p7zip-full