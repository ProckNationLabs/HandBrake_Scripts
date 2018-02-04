#!/bin/bash

#source: https://ubuntuforums.org/showthread.php?t=1692618


#Handbrake batch script to recursively encode every file in a certain directory
#FILES=/media/path/to/input/files/*/*
FILES=/media/jason/TempBackUp/HandBrakeProjects/DashCamVideoConverter/Sources/SD_Cards/Black_32GB_SD/08-16-2017_to_08-20-2017/DCIM/11170820//*/*
PRESET="iPhone & iPod touch"
for f in $FILES
do
  #f is the input file names, this line replaces all avi's (input) with mkv's (output)
  g=${f/avi/mp4}
  

  echo "Processing ${f} file..."

  # Edit this line with the various parameters you want to use. See https://trac.handbrake.fr/wiki/CLIGuide
  #HandBrakeCLI -C 2 -i "${f}" -o "${g}" -e x264 -S 40 -2 -T -E AC3 -B 64 -5 -8 strong
  HandBrakeCLI -i "${f}" -o "${g}" --preset="$PRESET"

done
