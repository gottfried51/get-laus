#! /bin/bash

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


######################################################################################
################## S T A R T   O F   S C R I P T #####################################
######################################################################################

# Updatescripts dürfen am Updatehost auf keinen Fall
# ausgeführt werden! Existierende Configfiles würden überschrieben!
if test $(hostname) = "laus01" 
then
	log_action_begin_msg "Updatescript may not run on  laus - Server!"
	echo "Updatescript may not run on  laus - Server!"
	exit 7
fi

# Function for executing all Scripts in Directory
function executeScripts {/*
 *                 [[ LAUS ]]
 *
 * Copyright (c) 2013 Reinhart Fink.
 *Shell Skript - Copyright (c) 2013 Reinhart Fink.
 *
 * This code is distributed under the GNU General Public License 
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * version 2, as published by the Free Software Foundation.
 * 
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License along
 * with this program; if not, write to the Free Software Foundation, Inc.,
 * 675 Mass Ave, Cambridge, MA 02139, USA.
 
	if test -z $1;
	then
		classHirarchy="ALLCLASSES";
	else
		classHirarchy="ALLCLASSES."$1;
	fi

	fileList=$(ls)
	for file in $fileList; do
		# test, if file is executable
		# echo $file
		if test -f $file -a -x $file -a $file = ${file%"~"};
		then
			# test, if script has already been executed on this workstation
			if test -f $UPDATE_LOG_DIR$"/"$/*
 *                 [[ LAUS ]]
 *
 * Copyright (c) 2013 Reinhart Fink.
 *Shell Skript - Copyright (c) 2013 Reinhart Fink.
 *
 * This code is distributed under the GNU General Public License 
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * version 2, as published by the Free Software Foundation.
 * 
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License along
 * with this program; if not, write to the Free Software Foundation, Inc.,
 * 675 Mass Ave, Cambridge, MA 02139, USA.
 classHirarchy"."$file
			then
				log_action_begin_msg "already executed --> "$classHirarchy"."$file
				#echo "already executed --> "$classHirarchy"."$file
			else
				log_action_begin_msg "running LAUS script --> "$classHirarchy"."$file
				#echo "running LAUS script --> "$classHirarchy"."$file
				"./"$file $startParameter
				# if script has been executed, log it"
				if test $? -eq 0;
				then
					cp $file $UPDATE_LOG_DIR$"/"$classHirarchy"."$file;
				fi
			fi
		fi
	done
}

## source system - functions
. /lib/init/vars.sh
. /lib/lsb/init-functions

# source Variables from laus-setup
. /etc/default/laus-setup

# set HOSTCLASS Variable from File hostsToClasses
#HOSTCLASS=$(grep $(hostname) hostsToClasses | awk 'BEGIN { FS = ";" } { print $2 }')
#SUBHOSTCLASS=$(grep $(hostname) hostsToClasses | awk 'BEGIN { FS = ";" } { print $3 }')
#SUBSUBHOSTCLASS=$(grep $(hostname) hostsToClasses | awk 'BEGIN { FS = ";" } { print $4 }')

# set HOSTCLASS Variable from File hostsToClasses
# check like tftp:
# for hostname r001pc12
# test following Strings:
# #1: r001pc12
# #2: r001pc1
# #3. r001pc
# ...
# #8: r
#
# and collect all information in:
# HOSTCLASS, SUBHOSTCLASS and SUBSUBHOSTCLASS
#
# see: HOSTCLASS=$HOSTCLASS" "$(grep ^$TESTSTRING";" hostsToClasses | awk 'BEGIN { FS = ";" } { print $2 }')
# and so on!
#
# hostsToClasses in format:
# HOSTNAME;HOSTCLASS;SUBHOSTCLASS;SUSUBHOSTCLASS
# r001pc50;TEACHER BEAMER;BEAMER_1024x768
# r001;R001
# => HOSTCLASS=TEACHER BEAMER R001 and SUBHOSTCLASS=BEAMER_1024x768
#
TESTSTRING=$(hostname)
# echo $TESTSTRING
# TESTSTRING_LENGTH=${#TESTSTRING}
for ((length=${#TESTSTRING};  length > 0; length--)) /*
 *                 [[ LAUS ]]
 *
 * Copyright (c) 2013 Reinhart Fink.
 *Shell Skript - Copyright (c) 2013 Reinhart Fink.
 *
 * This code is distributed under the GNU General Public License 
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * version 2, as published by the Free Software Foundation.
 * 
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License along
 * with this program; if not, write to the Free Software Foundation, Inc.,
 * 675 Mass Ave, Cambridge, MA 02139, USA.
 
do
	TESTSTRING=${TESTSTRING:0:length}
	if grep ^$TESTSTRING";" hostsToClasses
	then
		HOSTCLASS=$HOSTCLASS" "$(grep ^$TESTSTRING";" hostsToClasses | awk 'BEGIN { FS = ";" } { print $2 }')
		# echo "setzen von HOSTCLASS"
		# echo $HOSTCLASS
		SUBHOSTCLASS=$SUBHOSTCLASS" "$(grep ^$TESTSTRING";" hostsToClasses | awk 'BEGIN { FS = ";" } { print $3 }')
		# echo "setzen von SUBHOSTCLASS"
		# echo $SUBHOSTCLASS
		SUBSUBHOSTCLASS=$SUBSUBHOSTCLASS" "$(grep ^$TESTSTRING";" hostsToClasses | awk 'BEGIN { FS = ";" } { print $4 }')
		# echo "setzen von SUBSUBHOSTCLASS"
		# echo $SUBSUBHOSTCLASS
	fi
done/*
 *                 [[ LAUS ]]
 *
 * Copyright (c) 2013 Reinhart Fink.
 *Shell Skript - Copyright (c) 2013 Reinhart Fink.
 *
 * This code is distributed under the GNU General Public License 
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * version 2, as published by the Free Software Foundation.
 * 
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License along
 * with this program; if not, write to the Free Software Foundation, Inc.,
 * 675 Mass Ave, Cambridge, MA 02139, USA.
 

# souround List of hosts with () to cast to array
HOSTCLASS=($HOSTCLASS)
SUBHOSTCLASS=($SUBHOSTCLASS)
SUBSUBHOSTCLASS=($SUBSUBHOSTCLASS)

log_action_begin_msg "LAUS START --------------------------------------"

#### Startparameter mitteilen z.B: start, stop, cron
startParameter=$1

# run scripts for all hosts
cd scriptsForClasses
executeScripts

# run scripts for classes, sub- and subsubclasses

for hostclass in ${HOSTCLASS[@]}; do
	if test -d $hostclass; 
	then
		cd $hostclass;
		executeScripts $hostclass;
		for subhostclass in ${SUBHOSTCLASS[@]}; do
			if test -d $subhostclass; 
			then
				cd $subhostclass;
				executeScripts $hostclass"."$subhostclass;
				for subsubhostclass in ${SUBSUBHOSTCLASS[@]}; do
					if test -d $subsubhostclass; 
					then
						cd $subsubhostclass;
						executeScripts $hostclass"."$subhostclass"."$subsubhostclass;
						cd ..;
					fi;
				done;
				cd ..;
			fi;
		done;
		cd ..;
	fi;
done

log_action_begin_msg "LAUS STOP ---------------------------------------"



