#!/bin/bash
RED="\033[0;31m"
ENDCOLOR="\033[0m"
mypass=$1
ans=$(zenity  --list  --width=600 --height=670 --text "Choose your  $CODENAME Software Installations" --checklist  --column "Select" --column "Options" FALSE "Virtual Box" FALSE --separator=":")
if [ $? == 1 ]
then
	/usr/bin/notify-send "Program Terminated"
	exit 0
fi
function virtualbox()
{
	echo "=================================================="
	echo -e $RED"Installing VirtualBox"$ENDCOLOR
	/usr/bin/notify-send "Installing VirtualBox"
        wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | echo $mypass | sudo -S apt-key add -
        sudo sh -c  'echo "deb http://download.virtualbox.org/virtualbox/debian precise contrib" >> /etc/apt/sources.list'
        sudo apt-get update && sudo apt-get --force-yes -y install virtualbox-4.1
	return
}
arr=$(echo $ans | tr "\:" "\n")
for x in $arr
do
	if [ $x = "Virtual" ]
	then
	      virtualbox
	fi
	
done

