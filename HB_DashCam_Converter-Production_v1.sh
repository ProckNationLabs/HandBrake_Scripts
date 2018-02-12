#!/bin/bash

#---------------------------------------------------------------------
#
#			Notes about sourced code that started this script
#
#initiale source of this script was sourced from the below link
#source: https://surlyjake.com/blog/2010/08/10/script-to-run-handbrake-recursively-through-a-folder-tree/
#the current script currently has only a couple lines of code at most of 
#original, un-edited code.
#---------------------------------------------------------------------

#----------------------------------------------------------------------
#	This script is the beta version of the DashCam convertion script that
#	uses HandbreakCLI to re-encode the 3 minute AVI files generated by my
#	car's dashcam. When the AVI video file is re-encoded to a mp4 codec
#	the size of the file is on average reduced from around 400 MB to 
#	only 40 MB.  The is a file size reduction of about 10 percent. I do
#	this to save hard drive space.  The re-encoded 40 MB .mp4 version of the 
#	video file looks just as good in video quallity as the 400 MB AVI
#	version of the video file.  The re-encoding of these Dashcam video 
#	files reduced the amount of hard drive used by 90%.  This is why I
#	choose to re-encode.
#
#	Use this beta version of the script when making code changes. Do not 
# 	move the code changes to the Production version of the script until
#	the edited code has been thouroly tested.
#
#----------------------------------------------------------------------

# varibles for file and folder locations for mv routine
MVHBDEST="/media/jason/Backup2/VidConvert/DashCams/Black32GBSD/New_Vids/01-10-2018_to_01-12-2018/"
MVSDSOURCE="/media/jason/SD_VOL/DCIM"

#syslog loggin example: logger -p local0.notice -t SensorOutPutTest -f ~/sensors.txt

#start of first syslog message
logger --id=$$ --tag DashCamConverter -p local5.info Starting the DashCam Converter Production v1

# Change this to specify a different handbrake preset. You can list them by running: "HandBrakeCLI --preset-list"
PRESET="iPhone & iPod touch"

if [ -z "$1" ] ; then
    TRANSCODEDIR="."
else
    TRANSCODEDIR="$1"
fi

echo
echo Starting the DashCam Converter, Production version, Script at the following date/time:
date

# start the script to change the filenames to the file creation date and time
echo
echo
/home/jason/git_repositories/HandBrake_Scripts/HB_DashCam_Converter_Rename_Create_Date.sh

echo Starting to re-encode files to "$PRESET"
echo
find "$TRANSCODEDIR"/* -type f -exec bash -c 'HandBrakeCLI -i "$1" -o "${1%\.*}".mp4 --preset="iPhone & iPod touch"' __ {} \;
#find "$TRANSCODEDIR"/* -type f -exec bash -c ' echo "$1" -o "${1%\.*}".mp4 --preset="iPhone & iPod touch"' __ {} \;
echo
echo 'Opening Clone Permissions Script'
date
echo
/home/jason/git_repositories/HandBrake_Scripts/HB_DashCam_Converter_Clone_Permissions_Beta.sh

echo
echo 'Opening Batch Remove AVI Script'
date
/home/jason/git_repositories/HandBrake_Scripts/HB_DashCam_Converter_Remove_AVI.sh

logger --id=$$ --tag DashCamConverter -p local5.info Finished running the DashCam Converter Production v1

#---------------------------------------------------------------------
#  files and paths needed to run script from command line
#
#this folder has 2 subdirs and 3 avi files
#	cd /media/jason/Backup2/VidConvert/DashCams/Black32GBSD/10-21-2017_Black/DCIM
#	cd /media/jason/Backup2/VidConvert/DashCams

#	/home/jason/git_repositories/HandBrake_Scripts/HandbrakeProcessTreeGoodOneMaybe.sh

#   /media/jason/Backup2/VidConvert/DashCams/Testers/
#   Subdirs are Test1 - Test4. Test5 is for testing file permissions only.

#   /media/jason/SD_VOL

#===========The next line will be the command that needs to be ran in the folder
#===========that has the AVI files to convert. This is Production!!!============
#   /home/jason/git_repositories/HandBrake_Scripts/HB_DashCam_Converter-Production_v1.sh or
#   /home/jason/git_repositories/HandBrake_Scripts/HB_DashCam_Converter_Clone_Permissions.sh

