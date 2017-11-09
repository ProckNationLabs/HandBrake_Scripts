Re: A little help with a HandBrake Script
I'm working on a batch script that you might find useful. It is not very well tested yet, and the gui mode is non-functional. But the cli mode is complete. It's written in python.

I think it's recursive processing option might be useful for your situation. If all the "shows" are placed in subdirectories of one top level source directory, you can recursively encode all subdirs. The script will create the corresponding subdirectories for the output under the destination directory you specify.

It doesn't move the source files when complete. You would have to add that if it's required. It will skip transcoding any file it finds already exists in the destination. So if you are moving the files in order to avoid re-encoding the same file again, you might not need that.

pyhb.py --help
Code:
pyhb.py [-s <srcdir>] [-d <dstdir>] [-ehHn] [-- HandBrakeCLI-options]
    -s --srcdir       - Source directory of files to transcode. Default './'
    -d --dstdir       - Target directory of new transcoded files. Default './'
    -r --recursive    - Recursively process all subdirectories.
    -e --ext          - Set the source extensions to match.
                        Default ts,mp4,m4v,avi,mkv,mov,wmv,iso,vob
    -p --presets-file - Load custom preset file.
    -L --log-dir      - Directory where activity logs are stored.
    -I --instances    - Set number of simultaneous encodes.
    -h --help         - Show this message.
    -H --cli-help     - Show HandBrakeCLI help.
    -n --dryrun       - Show what would be done, but do nothing.
It can use custom presets that you have created with the handbrake gui. It creates activity log files for all encodes in the same place as the gui does (~/.config/ghb/EncodeLogs). It can lanuch multiple instances of HandBrakeCLI simultaneously in order to more fully utilize the CPU. You can set a list of file name extensions to match when searching for files to transcode. You can add any additional HandBrakeCLI options you like (after a "--" on the command line).

example:
Code:
pyhb.py -s "/storage00/Temp/TV" -d "/storage00/Video/Share/TV Shows" -r -- -Z MyCustomPreset
script:
Code:
