#!/bin/bash

# Update Ubuntu 12.04 to LibreOffice 4.1
if [ $(lsb_release -r -s) = "12.04" ];
then
  add-apt-repository -y ppa:libreoffice/libreoffice-4-1
fi
apt-get -y update

## Openoffice Gesamtpacket nachinstallieren
apt-get -y install libreoffice
apt-get -y install libreoffice-report-builder 
apt-get -y install libreoffice-writer2latex writer2latex
apt-get -y install libreoffice-help-de
#apt-get -y install ooo-thumbnailer

# Repair broken HSQL - dependency in deb package
apt-get -y install libhsqldb-java

## Openoffice Deutsches Sprachpaket nachinstallieren
apt-get -y install libreoffice-l10n-de

## Openoffice Sprechmodule für Rechtschreibprüfung
apt-get -y install hyphen-de myspell-de-at mythes-de

## additional Libreoffice - Packages
apt-get -y install libreoffice-pdfimport
# mozilla-libreoffice funktioniert nicht mehr
#apt-get -y install mozilla-libreoffice


