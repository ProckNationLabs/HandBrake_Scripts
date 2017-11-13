#!/bin/bash

# Your configuration stuff should go here - replace these with whatever you want
SRC=./SOURCE_FOLDER/
DEST=./DESTINATION_FOLDER/
DEST_EXT=mp4
HANDBRAKE_CLI=/Applications/HandBrakeCLI
PRESET="iPhone & iPod Touch"

# The meat of the script
for FILE in `ls $SRC`
do
        filename=$(basename $FILE)
        extension=${filename##*.}
        filename=${filename%.*}

        $HANDBRAKE_CLI -i $SRC/$FILE -o $DEST/$filename.$DEST_EXT --preset="$PRESET"
done
