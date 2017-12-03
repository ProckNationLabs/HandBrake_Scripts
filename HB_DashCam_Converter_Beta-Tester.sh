#!/bin/bash

#source: https://surlyjake.com/blog/2010/08/10/script-to-run-handbrake-recursively-through-a-folder-tree/

#for more information about this script see readme file with this same name


#
# Change this to specify a different handbrake preset. You can list them by running: "HandBrakeCLI --preset-list"
#


PRESET="iPhone & iPod touch"

if [ -z "$1" ] ; then
    TRANSCODEDIR="."
else
    TRANSCODEDIR="$1"
fi
    #find "$TRANSCODEDIR"/* -type f -exec bash -c 'HandBrakeCLI -i "$1" -o "${1%\.*}".mp4 --preset="iPhone & iPod touch"' __ {} \;
    
    
     find "$TRANSCODEDIR"/* -type f -exec bash -c ' HandBrakeCLI -v -i "$1" -o "${1%\.*}".mp4 --preset="iPhone & iPod touch"' __ {} \;

#---------------------------------------------------------------------
#  files and paths needed to run script from command line
#
#this folder has 2 subdirs and 3 avi files
#	cd /media/jason/Backup2/VidConvert/DashCams/Black32GBSD/10-21-2017_Black/DCIM
#	cd /media/jason/Backup2/VidConvert/DashCams

#	/home/jason/git_repositories/HandBrake_Scripts/HandbrakeProcessTreeGoodOneMaybe.sh


