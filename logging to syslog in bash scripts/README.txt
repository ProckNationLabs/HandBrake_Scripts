to log messages to the syslog from inside your bash script use the 'logger'
command.

Good way toknow when events in your script have executed or happened.  i.e.
-when script file starts
-when script preforms a bash execution
-which files are in use while the script works on them
-when the script ends
-etc

example; logger -p local0.notice -t SensorOutPutTest -f ~/sensors.txt

