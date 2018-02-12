#!/bin/bash
#12.06.2017 01:32:45

#/home/jason/git_repositories/HandBrake_Scripts/HB_DashCam_Converter_Rename_Create_Date.sh

# Test folder: /media/jason/Backup2/VidConvert/DashCams/Testers/Test6/Test
# /media/jason/Backup2/VidConvert/DashCams/Testers/Test6/Test/20180210/09270168.AVI

#2018:02:10 04:07:16-06:00

#correct format to both add 6 hours and convert to an ok format: date --date="2018-02-10 04:13:20 -12:00" +%Y-%m-%d_%H-%M-%S

#/media/jason/Backup2/VidConvert/DashCams/Testers/Test6/10180210/09270168.AVI

find "$TRANSCODEDIR"/* -name *.AVI -type f -exec bash -c '/home/jason/git_repositories/HandBrake_Scripts/HB_DashCam_Converter_Rename_Create_Date.sh "$1"' __ {} \;

ModDate=$(exiftool -FileModifyDate -s3 "$1")
ModDate=${ModDate/:/-}
ModDate=${ModDate/:/-}
ModDate=${ModDate/-06/' -12'}
ModDate2=$(date --date="$ModDate" +%Y-%m-%d_%H-%M-%S)
filename=DashCam_${ModDate2}.AVI
#echo $filename
rootname=$(basename $1)
echo
#echo $1
#echo $rootname
#echo
fullfilename=${1%$rootname}$filename
#echo $fullfilename
#echo
echo Renaming $1 to $fullfilename
mv -T $1 $fullfilename
echo Exit code $?
echo
