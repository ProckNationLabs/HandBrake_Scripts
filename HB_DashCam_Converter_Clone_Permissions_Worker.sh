#!/bin/bash
#12.06.2017 01:32:45
#
#----------------------------------------------------------------------
#  HB_DashCam_Converter_Beta-Tester.sh
#  
#  Copyright 2017 Jason Procknow <jprocknow@gmail.com>
#  
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#  
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#  
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
#  MA 02110-1301, USA.
#  
#  


#---------------------------------------------------------------------
#
#           Notes about sourced code that started this script
#
#initiale source of this script was sourced from the below link
#source: https://surlyjake.com/blog/2010/08/10/script-to-run-handbrake-recursively-through-a-folder-tree/
#the current script currently has only a couple lines of code at most of 
#original, un-edited code.
#---------------------------------------------------------------------

#----------------------------------------------------------------------
#   This script is the beta version of the DashCam convertion script that
#   uses HandbreakCLI to re-encode the 3 minute AVI files generated by my
#   car's dashcam. When the AVI video file is re-encoded to a mp4 codec
#   the size of the file is on average reduced from around 400 MB to 
#   only 40 MB.  The is a file size reduction of about 10 percent. I do
#   this to save hard drive space.  The re-encoded 40 MB .mp4 version of the 
#   video file looks just as good in video quallity as the 400 MB AVI
#   version of the video file.  The re-encoding of these Dashcam video 
#   files reduced the amount of hard drive used by 90%.  This is why I
#   choose to re-encode.
#
#   Use this beta version of the script when making code changes. Do not 
#   move the code changes to the Production version of the script until
#   the edited code has been thouroly tested.
#
#----------------------------------------------------------------------

#command to run this script: /home/jason/git_repositories/HandBrake_Scripts/HB_DashCam_Converter_Clone_Permissions_Worker.sh

echo
echo Starting to clone permissions from "$1" to "${1%\.*}".mp4
chmod --reference="$1" "${1%\.*}".mp4
echo Finished cloning permissions from "$1" to "${1%\.*}".mp4 with exit code of "$?"
echo

#Original source -> find /path/to/dest/ -type f -print0 | xargs -O -I {} chmod --reference=/path/to/rfile.txt {}
#Sourced from here -> https://www.cyberciti.biz/faq/how-to-copy-permissions-from-one-file-to-another-on-linux/


