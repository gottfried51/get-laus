#! /bin/bash

apt-get -y update

## Eclipse
apt-get -y install eclipse

## install Plugins

## install Derby - Plugin
cp -R files/eclipse-dropins/derby		/usr/share/eclipse/dropins

## install Lejos - Plugin
cp -R files/eclipse-dropins/lejos		/usr/share/eclipse/dropins

## install Python - Plugin
cp -R files/eclipse-dropins/python		/usr/share/eclipse/dropins



