Linux Automatic Update System

Einleitung:

Kurzbeschreibung:

Linux Automatic Update System (kurz LAUS :-) bietet ein Konzept um Klassen von Linux – Workstations mit selbst erstellten Skripts zu konfigurieren und upzudaten. 
Neben dem ausfühlichen Beispiel sind Vorlagen für Skripts im Verzeichnis templates vorhanden.

Um diese Skripts auszuführen, mountet eine Linux – Workstations (LAUS – Client) mit seinem LAUS – Clientskriptes (laus_client.sh) ein NFS exportiertes Verzeichnis vom LAUS – Server, und führt das dort vorhandene LAUS – Serverskript (laus_server.sh) lokal aus. 
Das Serverskript wiederum überprüft, ob neue Konfigurations- bzw. Updateskripts für die Linux – Workstation vorhanden sind und bringt diese dann genau 1 mal zur Ausführung.

Das bedeutet:

Die die LAUS – Skripts werden zentral auf einem Server verwaltet!
Die Skripte sind als BASH – Skripte verwirklicht, es können aber auch andere Sprachen (PERL usw.) verwendet werden.

Der LAUS – Client bestimmt durch seine Klassenzugehörigkeit, welche Skripte er genau 1x ausführt.

LAUS hält seine Client – Klassen im gesamten Netz auf einheitlichem Stand.

LAUS läuft beim Booten als Startskript, bei Herunterfahren als Stopskript und kann zusätzlich vom Cron – Daemon gestartet werden.

Einmal erstellte Konfiguration lassen sich schnell auf andere Workstations bzw. Klassen übertragen. 
(z.B.: xcdroast Einstellungen für den nonroot – Mode, Terminalserver)

Die LAUS – Konfigurations- bzw. Updateskripts dokumentieren die Veränderungen der Worstations ausgehend von einem Anfangszustand.
An Hand von Sicherungskopien der geänderten Konfigurationsdateien lassen sich die Veränderungen zurückverfolgen bzw. rückgängig machen.

Unterschiede zu anderen Konzepten:

autoyast von SuSE:

Mit autoyast lassen sich Linux – Workstations fertig konfiguriert installieren. 
(LAUS wird im nachfolgenden Beispiel mit Hilfe von autoyast bei der Erstinstallation auf die Workstation eingespielt!)

+ autoyast benötigt keine Skript – Kenntnisse (nicht alle Skripte sind leicht lesbar); die Konfiguration wird über ein Grafiktool in xml – Files abgespeichert.

- autoyast läuft nur bei der Erstinstallation. Bei spätere Änderungen muss die Workstation neu installiert werden.

Zu YOU (YaST Online Update) von SuSE:

YOU spielt neue rpm – Pakete vom SuSE – Server automatisch ein.

- Änderungen bleiben auf rpm – Pakete beschränkt.

Zum Klonen:

- Änderungen am Masterimage sollten dokumentiert werden. (Wer weiss noch was in welchen Files was geändert wurde?! ;-( )

- für verschiedene Rechnerklassen müssen evt. verschiedene Images gepflegt werden. 
(z.B.: verschiedene Printserver für gleiche Rechner in verschiedenen Räumen)

Aufgabenbereiche:

Übersicht:

auf Client – Klassen im Netz Programmpakete nachinstallieren (z.B. neuere Version von Mozilla, OpenOffice oder KDE einspielen, )

auf Client – Klassen im Netz Programmpakete anpassen (z.B. neue Browserplugins oder OpenOffice Wörterbuch einspielen)

auf Client – Klassen im Netz Dienste in Konfigurationsdateien anpassen (z.B. LDAP –, CUPS – Server einstellen, Shutdown – Zeit setzen usw.)




Installation:

LAUS – Server:

Am LAUS – Server ist folgende Verzeichnisstruktur (siehe Bild) anzulegen, aus der dann /opt/autoinstall über NFS exportiert werden muss.
(in /etc/exports Zeile „/home/autoinstall 192.168.0.0/255.255.0.0(ro,no_root_squash)“ eintragen.)

Beschreibung der Verzeichnisse:

/opt/autoinstall/laus:
Das Verzeichnis mit dem LAUS – Serverskript (laus_server.sh) und den Konfigurationsskripts in /opt/autoinstall/laus/scripts_to_run

/opt/autoinstall/programs
Das Verzeichnis mit den Programmpakete, die upgedatet wurden.
+ OpenOffice
+ Mozilla, Netscape
+ Java
+ Acrobat
+ ganze KDE

LAUS – Client:

Arbeitsschritte: (im Beispiel bei der Erstinstallation von autoyast erledigt)

Auf den LAUS – Clients wird das LAUS – Clientskript (laus_client.sh im Server – Ast) in das Verzeichnis für die Startskripte kopiert, (bei SuSE /etc/init.d) und in die entsprechenden Runlevelverzeichnisse verlinkt.
Das Startskript muss am Schluss aller Startskript laufen. z.B.: S50laus.
Das Stopskript muss am Anfang aller Stopskripte laufen. K01laus
Das LAUS – System sollte nun wie jeder andere Dienst beim Hoch – bzw. Herunterfahren der Workstation aufgerufen werden.

Das LAUS – Client – Konfigurationsfile (laus im Server – Ast ) wird zu den anderen Konfigurationsfiles nach /etc/sysconfig (bei SuSE) kopiert.

Einstellungen des LAUS – Client – Konfigurationsfile's: (hier als Beispiel ein Celeron 800 im Informatikraum Nr. 1) festlegen.

#
#       Configuration - Script for LAUS - Client
#

ENABLE_AUTOUPDATE="yes"

# Server hosting all LAUS - scripts:
LAUS_SERVER="laus1"

# Rootpath,where LAUS - directory is stored:
ROOT_PATH_ON_LAUS_SERVER="/opt/autoinstall"

# Directory, relativ to ROOT_PATH_ON_LAUS_SERVER, where laus_server.sh - script is stored:
LAUS_PATH="laus"

# Mountpoint on client, for Serverdirectory
# Because of correspondendig pathes
# ROOT_PATH_ON_LAUS_SERVER should be the same as MOUNT_PATH_ON_CLIENT
MOUNT_PATH_ON_CLIENT="/opt/autoinstall"


# Hostclasses host belongs to: write as (HOSTCLASS1 HOSTCLASS etc)
HOSTCLASS=(CELERON800 KDE3 CUPS_CLIENT)

# Subhostclass host belongs to:
SUBHOSTCLASS=(PRS1_IN1)

# Subsubhostclass host belongs to:
SUBSUBHOSTCLASS=()

# Path, where updatelogfiles are written to:
UPDATE_LOG_DIR="/var/log/laus"

Das LAUS – Clientskript (laus_client.sh) erzeugt dann die Verzeichnisse zur Verwaltung bereits abgelaufener Skripte (/var/log/laus) 
und den Mountpoint für den Server – Ast von LAUS (/opt/autoinstall) an Hand der Einstellungen im Konfigurationsfile /etc/sysconfig/laus selbst.
ACHTUNG:
LAUS kann nur Untererzeichnisse in bereits bestehenden Verzeichnissen erzeugen. 
(d.h. autoinstall kann in /opt erzeugt werden, jedoch nicht: /opt/einWeiteresVerzeichnis/autoinstall .)

Tips zum Schreiben eigener Skripts:

Aufgabe des Beispielskriptes clear_tem_dirs_at_boot_up.sh ist: Änderung in /etc/sysconfig/cron, sodass temporäre Files in tmp – Verzeichnissen gelöscht werden.
Zeilennummern in den Tips beziehen sich auf das nachfolgende Beispiel.

Stil:
Skripts, wenn möglich im Stil von Systemskripts halten.
Hier werden die Funktionen aus /etc/rc.status (13) der SuSE Distribution verwendet.
Für Statusmeldungen werden ebenfalls SuSE – Funktionen verwendet. (70,71)

Variablen aus /etc/sysconfig/laus müssen eingebunden werden. Siehe Zeile 49.

Aussagekräftige Skriptnamen verwenden!
Die Skriptnamen sollten die Aufgabe des Skriptes beschreiben.

Information an die Skripten weitergeben:
Ein Aufrufparameter wird an die eigene Skripte durchgereicht. 
Wird LAUS von root auf der Konsole mit 
>> /etc/init.d/laus start 
aufgerufen steht der Parameter start mittels $1 in allen Skripten zur Verfügung.

Wo sind die Skripts abzuspeichern?
Skripts, die auf alle Workstations laufen sollen, werden in /opt/autoinstall/laus/scripts_to_run/ abgelegt.
Sie scheinen dann in /var/log/laus mit einem vorgestellten ALLCLASSES. auf.
Skripts, die für Sub – bzw. SubSubklassen laufen sollen, werden in /opt/autoinstall/laus/scripts_to_run/ in den jeweiligen gleichnamigen Unterverzeichnissen abgelegt.

Skript – Logging in eigenen Skripts verwenden!
Wenn Dateien verändert werden, Sicherungsmechanismus aus Zeile 55 – 61 verwenden.
Ursprüngliches Datei „aFile“ wird mit Endung „.original“ als „aFile.original“ abgespeichert, falls sie noch nicht existiert. (57 – 58)
Bevor eine Datei geändert wird, wird eine Sicherungskopie mit dem Namen „aFile.laus.Datum-Uhrzeit“ erstellt. (59 -61)
Änderungen werden aus der Datei „aFile.laus.Datum-Uhrzeit“ erzeugt und nach „aFile“ abgespeichert. (64)

Wenn die Reihenfolge von Skripts wichtig ist!
Sind Skripts im Ablauf voneinander abhängig, dann empfiehlt es sich die Skriptnamen wie folgt zu wählen:
010-010_install_mozilla.sh
010-020_install_mozilla_java_plugin.sh
010-030_install_mozilla_flash_plugin.sh
usw.
Muss später (wer weiss schon alles voher) ein weiteres Plugin installiert werden, das Java benötig, läßt es sich mit 
010-025_install_mozilla_needs_java_plugin.sh
an der richtigen Stelle einfügen.

Skripte mit TESTCASE testen:
An einer Workstation die Klasse TESTCASE in /etc/syscnfig/laus in Zeile HOSTCLASS= anlegen und die zu testenden Skripts am LAUS – Server dort speichern.

Skripte erneut zur Ausführung bringen:
Skripts können nochmals ausgeführt werden, in dem das log – Skript mit dem selben Namen in /var/log/laus gelöscht wird.
Das Löschen von /var/log/laus/ALLCLASSES.clear_tem_dirs_at_boot_up.sh bringt das Script clear_tem_dirs_at_boot_up.sh nochmals zur Ausführung.
ACHTUNG:
Zeilen oder Einträge in Zeilen werden dann teilweise wieder angefügt. Vor der erneuten Ausführung muss daher evt. die ursprüngliche Datei aus „aFile.original“ oder dem File vor der letzten Änderung wiederherstellt werden.

Auf den programs – Ast am LAUS – Server zugreifen
Auf programs kann in den eigenen Skripten mit $PROGRAM_PATH zugegriffen werden, da im Serverskript die Variable PROGRAM_PATH wie folgt exportiert wird:
export PROGRAM_PATH=$ROOT_PATH_ON_LAUS_SERVER"/programs".

Installation von Programmen, die eine Installationsroutine mitbringen:
+ Programm mittels der Installationsroutine auf einer Workstation installieren.
+ mit „tar -zcf neuesProgramm.tar“ neues Programm ein tar – File erzeugen, 
+ Script schreiben, welches das Programm mit „tar -xzf neuesProgramm.tar“ auf den anderen Workstation an der richtigen Stelle entpackt

#! /bin/sh

# Shell functions sourced from /etc/rc.status:
#      rc_check         check and set local and overall rc status
#      rc_status        check and set local and overall rc status
#      rc_status -v     ditto but be verbose in local rc status
#      rc_status -v -r  ditto and clear the local rc status
#      rc_failed        set local and overall rc status to failed
#      rc_failed <num>  set local and overall rc status to <num><num>
#      rc_reset         clear local rc status (overall remains)
#      rc_exit          exit appropriate to overall rc status
#      rc_active        checks whether a service is activated by symlinks
. /etc/rc.status

# First reset status of this service
rc_reset

# Return values acc. to LSB for all commands but status:
# 0 - success
# 1 - generic or unspecified error
# 2 - invalid or excess argument(s)
# 3 - unimplemented feature (e.g. "reload")
# 4 - insufficient privilege
# 5 - program is not installed
# 6 - program is not configured
# 7 - program is not running

# Shell Variables sourced from /etc/sysconfig/laus
## ENABLE_AUTOUPDATE="yes"
# Server hosting all LAUS - scripts:
## LAUS_SERVER="laus1"
# Rootpath,where LAUS - directory is stored:
## ROOT_PATH_ON_LAUS_SERVER="/opt/autoinstall"
# Directory, relativ to ROOT_PATH_ON_LAUS_SERVER, where laus_server.sh - script is stored:
## LAUS_PATH="laus"
# Mountpoint on client, for Serverdirectory
# Because of correspondendig pathes
# ROOT_PATH_ON_LAUS_SERVER should be the same as MOUNT_PATH_ON_CLIENT
## MOUNT_PATH_ON_CLIENT="/opt/autoinstall"
# Hostclasses host belongs to:
## HOSTCLASS=()
# Subhostclass host belongs to:
## SUBHOSTCLASS=()
# Subsubhostclass host belongs to:
## SUBSUBHOSTCLASS=()
# Path, where updatelogfiles are written to:
## UPDATE_LOG_DIR="/var/log/laus"

. /etc/sysconfig/laus

######################################################################################
################## S T A R T   O F   S C R I P T #####################################
######################################################################################

file="/etc/sysconfig/cron"
if ! test -f $file".original"; then
        cp $file $file".original"
fi
updatetime=$(date +%Y%m%d-%T)
newfile=$file".laus."$updatetime
cp $file $newfile

## String ersetzen
sed '/CLEAR_TMP_DIRS_AT_BOOTUP=/ s/no/yes/' $newfile > $file

######################################################################################
################## S T O P   O F   S C R I P T #######################################
######################################################################################

rc_status -v
rc_exit


Entwickler:

Reinhard Fink: reinhard.fink@tsn.at