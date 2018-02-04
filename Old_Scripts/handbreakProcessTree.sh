#!/bin/bash

#sourced from https://stackoverflow.com/questions/19562785/handbrakecli-bash-script-convert-all-videos-in-a-folder

# This Script Goes in Root Folder of TV show -- Example Folder Structure
# /Stargate/Season\ 1/Epiosde.avi
# /Stargate/Season\ 2/Epiosde.avi
# /Stargate/handbrake_folder.script
# Outputs all Files back inside same dir's and does all folders inside Startgate DIR

# /Stargate/Season\ 1/Epiosde.mp4
# /Stargate/Season\ 2/Epiosde.mp4

# PRESET = -o flags for CLI can be got from GUI under Activity Log or from https://trac.handbrake.fr/wiki/CLIGuide OR you can use actual Presets!

# PRESET="iPhone & iPod Touch"

PRESET="--modulus 2 -e x264 -q 20 --vfr -a 1 -E ac3 -6 5point1 -R Auto -B 384 -D 0 --gain 0 --audio-fallback ac3 --encoder-preset=veryfast  --encoder-level="5.2"  --encoder-profile=high  --verbose=1"

if [ -z "$1" ] ; then
TRANSCODEDIR="."
else
TRANSCODEDIR="$1"
fi

find "$TRANSCODEDIR"/* -type f -name "*.avi" -exec bash -c 'HandBrakeCLI -i "$1" -o "${1%\.*}".mp4 --preset="$PRESET"' __ {} \; && find . -name '*.avi' -exec rm -r     {} \;
