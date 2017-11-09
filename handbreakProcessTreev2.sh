#!/bin/bash

#code sourced from
#https://stackoverflow.com/questions/19562785/handbrakecli-bash-script-convert-all-videos-in-a-folder

SRC="/home/abc/public_html/filex/store/vids/toriko/VIDEOS HERE"
DEST="/home/abc/public_html/filex/store/vids/toriko/51-100"
DEST_EXT=mp4
HANDBRAKE_CLI=HandBrakeCLI

for FILE in "$SRC"/*
do
    filename=$(basename "$FILE")
    extension=${filename##*.}
    filename=${filename%.*}
    $HANDBRAKE_CLI -i "$FILE" -o "$DEST"/"$filename".$DEST_EXT
done
