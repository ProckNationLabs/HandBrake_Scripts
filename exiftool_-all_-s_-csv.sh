#!/bin/bash

# /home/jason/git_repositories/HandBrake_Scripts/exiftool_-all_-s_-csv.sh

#	exiftool −a −u −g1 a.jpg
#	 Print all meta information in an image, including duplicate and unknown tags, sorted by group (for
#	 family 1).

# varibles for file and folder locations for mv routine
SDSOURCE="/media/jason/SD_VOL/DCIM"
#DEST="/media/jason/Backup2/VidConvert/DashCams/newvids"

if [ -z "$1" ] ; then
	echo no destination folder argument given. Using current folder of "$PWD".
	DEST="$PWD"
else
    DEST="$1"
    echo Using argument of "$1" as destination directory as long as it exsits.  That will be tested next.
fi

if [ -d "$DEST" ]
then
	echo destination folder at "$DEST" is valid.
else
	echo destination folder at "$DEST" is invalid. Exiting script using exit2.
	exit 2
fi


if [ -d "$SDSOURCE" ]
then
	echo SD folder at "$SDSOURCE" is valid.
else
	echo SD folder at "$SDSOURCE" is invalid. Exiting script using exit2.
	exit 2
#	SDSOURCE="/media/jason/SD_VOL/DCIM"
#	echo Using default SD folder of /media/jason/SD_VOL/DCIM
fi

exiftool -all -r -s -csv /media/jason/SD_VOL/DCIM > ./exif_all_tags_s_r.csv

exiftool -all -G4 -h ./ > ./exif_all_tagsG4.html

cp −−attributes−only −−no−target−directory ./09270168.AVI ./09270168.mp4

exiftool -listg ./09270168.AVI

exiftool -s /media/jason/Backup2/VidConvert/DashCams/Testers/Test6/10180210/09270168.AVI


date --date='1970-01-01 00:02:00 +0000'

date; date --date="-12 hours ago" +%H%M-%d%m%Y

2018:02:10 04:13:20-06:00

date --date="2018:02:10 04:13:20-06:00" +%H%M-%d%m%Y
date --date="2018-02-10 04:13:20 -12:00" +%Y-%m-%d_%H-%M-%S
