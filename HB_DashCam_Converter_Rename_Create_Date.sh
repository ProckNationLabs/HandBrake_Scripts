#!/bin/bash
#12.06.2017 01:32:45

#/home/jason/git_repositories/HandBrake_Scripts/HB_DashCam_Converter_Rename_Create_Date.sh

# Test folder: /media/jason/Backup2/VidConvert/DashCams/Testers/Test6/Test
# /media/jason/Backup2/VidConvert/DashCams/Testers/Test6/Test/20180210/09270168.AVI

#2018:02:10 04:07:16-06:00

#correct format to both add 6 hours and convert to an ok format: date --date="2018-02-10 04:13:20 -12:00" +%Y-%m-%d_%H-%M-%S

#/media/jason/Backup2/VidConvert/DashCams/Testers/Test6/10180210/09270168.AVI

logger --id=$$ --tag DashCamConverter -p local5.notice Started running the DashCam Converter File Renaming Script
echo
echo 'Starting File Renaming Script'
date
echo

if [ -z "$1" ] ; then
    TRANSCODEDIR="."
else
    TRANSCODEDIR="$1"
fi

find "$TRANSCODEDIR"/* -name *.AVI -type f -exec bash -c '/home/jason/git_repositories/HandBrake_Scripts/HB_DashCam_Converter_Rename_Create_Date_Worker.sh "$1"' __ {} \;

echo
echo 'Finished File Renaming Script'
date
echo
logger --id=$$ --tag DashCamConverter -p local5.notice Finnished running the DashCam Converter File Renaming Script Exit code $?
