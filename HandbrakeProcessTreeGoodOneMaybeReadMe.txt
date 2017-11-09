Script to run handbrake recursively through a folder tree
Date  Tue 10 August 2010 Tags bash script / Handbrake / recursive
Handbrake is a fantastic tool for (among other uses), converting videos into mobile formats. It is extremely easy to use and can usually get a video properly converted in just a few clicks. To get Videos encoded for use on my phone, I use the "iPhone & iPod Touch" preset. It will convert your video to .mp4 as well as scale it down to a consumable size. This format will work on any smartphone I've seen.

My issue is that when converting a folder full of videos, I don't want to have to use the gui to add a bunch of videos to the queue one by one. Its a very clicky process. This simple bash script will walk handbrake through all the files in a selected folder (and its subfolders). This uses the find command to traverse recursively through a directory structure. It will place the transcoded file in the same folder as its source and change its extension to ".mp4".

Usage: handbrakefolder.sh [FOLDER] Run handbrake on all the files contained in [FOLDER]. (the current directory by default)

#!/bin/bash
#
# Change this to specify a different handbrake preset. You can list them by running: "HandBrakeCLI --preset-list"
#
PRESET="iPhone & iPod Touch"
if [ -z "$1" ] ; then
    TRANSCODEDIR="."
else
    TRANSCODEDIR="$1"
fi
    find "$TRANSCODEDIR"/* -type f -exec bash -c 'HandBrakeCLI -i "$1" -o "${1%\.*}".mp4 --preset="$PRESET"' __ {} \;
Save that into a .sh file like "handbrakefolder.sh" and grant it the execute permission (chmod +x handbrakefolder.sh).

Thanks to Vinnie and http://mywiki.wooledge.org/UsingFind for their help in this.

Now you can simply execute this script against a folder containing your video files. like this:

For a folder structure like this:
Videos
-> show1
    vid1.avi
-> show2
    -> season 1
        ep1.avi
        ep2.avi
    -> season 2
        ep1.avi
        ep2.avi
-> show3
    vid1.avi
    vid2.avi

hostname% handbrakefolder.sh Videos
...
....
...
When done, it will look like this:
Videos
-> show1
    vid1.avi
    vid1.mp4
-> show2
    -> season 1
        ep1.avi
        ep1.mp4
        ep2.avi
        ep2.mp4
    -> season 2
        ep1.avi
        ep1.mp4
        ep2.avi
        ep2.mp4
-> show3
    vid1.avi
    vid1.mp4
    vid2.avi
    vid2.mp4
Comment
