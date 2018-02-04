#!/bin/bash

# Your configuration stuff should go here - replace these with whatever you want
#SRC=/media/jason/TempBackUp/HandBrakeProjects/DashCamVideoConverter/Sources/SD_Cards/Black_32GB_SD/08-16-2017_to_08-20-2017/DCIM/11170820
#DEST=/home/jason/Videos/DashCams
SRC=/media/jason/TempBackUp/HandBrakeProjects/Private_Convert
DEST=/home/jason/Videos/Private_Convert
DEST_EXT=mp4
HANDBRAKE_CLI=HandBrakeCLI
PRESET="iPhone & iPod touch"

# The meat of the script
for FILE in `ls $SRC`
do
        filename=$(basename $FILE)
        extension=${filename##*.}
        filename=${filename%.*}

        $HANDBRAKE_CLI -i $SRC/$FILE -o $DEST/$filename.$DEST_EXT --preset="$PRESET"
done
