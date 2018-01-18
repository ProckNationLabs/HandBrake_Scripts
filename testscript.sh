#!/bin/bash

#testscript.sh

echo 'This is a test script!'

MMVHBDESTBASE="/media/jason/Backup2/VidConvert/DashCams/newvids"
MVSDSOURCEBASE="/media/jason/SD_VOL/DCIM"

prog_init(){
if [ -z "$1" ] ; then
    MMVHBDESTBASE="/media/jason/Backup2/VidConvert/DashCams/newvids"
else
    MMVHBDESTBASE="$1"
fi

if [ ! -d "$MMVHBDESTBASE" ] ; then
	echo The destination base folder at "$MMVHBDESTBASE" is not valid. Please rerun script with a valid base folder location.
	exit 2
fi

MMVHBDESTBASEDated="$MMVHBDESTBASE"\/$(date -I)

if [ ! -d "$MMVHBDESTBASEDated" ] ; then
	echo Destination working folder at "$MMVHBDESTBASEDated" is not valid
fi
}

read_options(){
	local choice
	read -p "Would you like to create the folder $MMVHBDESTBASEDated right now or exit the script? ('C'reate or 'E'xit)" choice
	case $choice in
		C) mknewdatedfolder ;;
		c) mknewdatedfolder ;;
		E) exit 3 ;;
		e) exit 3 ;;
		0) exit 3;;
		*) echo -e "${RED}Error...${STD}" && sleep 2
	esac
}

mknewdatedfolder(){
	mkdir "$MMVHBDESTBASEDated"
	if [ $? -eq 0 ] ; then
		echo "$MMVHBDESTBASEDated" was created successfully
		cd "$MMVHBDESTBASEDated"
	else
		echo "$MMVHBDESTBASEDated" could not be created. Exiting.
		exit 2
	fi
}

# ----------------------------------------------
# Step #3: Trap CTRL+C, CTRL+Z and quit singles
# ----------------------------------------------
trap '' SIGINT SIGQUIT SIGTSTP

# -----------------------------------
# Step #4: Main logic - infinite loop
# ------------------------------------
while true
do
	prog_init
	#show_menu1
	read_options
done


#if [ $? -eq 0 ] ; then
#	echo 'Tstatus = 0!'
#fi

#if [ $? -ne 0 ] ; then
#	echo 'status not zero!'
#fi
