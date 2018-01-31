# /HandBrake_Scripts
---
## Purpose
Bash scripts to run handbrake on all files in current directory and all sub-directories.

## How To Use the Script
Currently the main script does not use any command line arguments.  Future development of the script will introduce command line arguments such as options and folder path(s) that need to be processed.  ***Stay tuned to this GitHub repo***.

## Git Repo Info
As of 01-30-2018 the current main script is:

    /HandBrake_Scripts/HB_DashCam_Converter-Production_v1.sh
	Bash shell alias is: DashCamConvert
An alternate script to run instead of the main script is:

	/HandBrake_Scripts/HB_DashCam_Converter-Production_no-remove-avi_v1.sh
	Bash shell alias is: DashCamConvertNoRMAvi
	 - This script is the same as the main script except it skips the "remove avi files" function

The Bash shell alias is currently setup on the following computers:
- z400-workstation
- and maybe the HP EliteBook laptop


By main script I mean the script that needs to be ran first that will do the error code detection the checking to make 
sure all the files and directories are in the correct places and will execute all the other scripts that preform the specific actions if they are required and so on and so on....

## Script Version Number Purpose
By adding the version number at the end of the script name it is now possible to instantly know if **HB_DashCam_Converter-Production_v1.sh** and **HB_DashCam_Converter-Production_no-remove-avi_v1.sh** are using the exact same code minus the minor alteration named in the filename.  If the filenames end with the same version number then the code is exactly the same.  All **v1** files will have the exact same functionality as any other **v1** files minus the named alteration.

## Misc Info
All the other files are either support files (which you will know if they are because they will be in the main script executed) or they are test scripts I used when working out how to first engineer this script.

