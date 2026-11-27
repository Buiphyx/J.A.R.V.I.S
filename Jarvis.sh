#!/bin/bash

logfilelocation="$HOME/logs/bashlogs.log"

if [ ! -d "$HOME/logs" ]
then
    echo "Logfile directory does not exist, creating directory"
    mkdir "$HOME/logs"
fi

#HELP FUNCTION
showhelp(){
cat << EOF
*******************************************

Welcome Home, Sir. What can I do for you?

-------------------------------------------
SYSTEM INFO:
  ip         -> Display the IP address of this machine
  hostname   -> Display the hostname of this machine
  uptime     -> Display how long this machine has been running
  datetime   -> Display the time and date

SYSTEM TOOLS:
  replacewords -> Replace words in a file
  diskcheck    -> Check filesystem disk usage
  memcheck     -> Display RAM and swap usage

EXTRA:
  help       -> Display this help message
-------------------------------------------
*******************************************
EOF
}

#SHOW IP ADDRESS FUNCTION
showip(){
echo "This machine's IP address is:"
hostname -I | awk '{print $1}'
}

#SHOW HOSTNAME FUNCTION
showhostname(){
echo "This machine's hostname is:"
hostname
}

#SHOW UPTIME
showuptime(){
local up=$(uptime -p | cut -c4-)
local since=$(uptime -s)
cat << EOF
==============

This machine has been up for ${up}

It has been running since ${since}

==============
EOF
}

#SHOW DATETIME
showdatetime(){
TZ='Africa/Cairo' date "+%d-%m-%y - %H-%M-%S"
}

#REPLACEWORDS FUNCTION
replacewords(){
echo "Enter the file to perform the function on:"
read file
echo "What word do you want to change?"
read word1
echo "Change it to:"
read word2
while true; do
    read -p "Do you want to create a backup of the original file? (Y/N) " backup
    case $backup in
        [Yy]*) backupfile="-i.backup"; break;;
        [Nn]*) backupfile=""; break;;
    esac
done
sed $backupfile "s/$word1/$word2/g" "$file"
}

#DISKCHECK FUNCTION
##this function displays the system disk usage
diskcheck(){
echo "Disk usage (excluding virtual/tmp filesystems):"
df -h -x tmpfs -x devtmpfs
}

#MEMCHECK FUNCTION
##this function displays the memory and swap usage
memcheck(){
echo "Memory and swap usage:"
free -h
}

case "$1" in
    "help")
        showhelp;;

    "ip")
        showip;;

    "hostname")
        showhostname;;

    "uptime")
        showuptime;;

    "datetime")
        showdatetime;;

    "replacewords")
        replacewords;;

    "diskcheck")
        diskcheck;;

    "memcheck")
        memcheck;;

    *)
        showhelp;;
esac

## The final block acts as an audit logger: every time you run the script with an argument ($1),
## it appends a timestamped entry showing who ran the script, which file was run, and which option was used.

if ! [ -z "$1" ]
then
    echo "$(showdatetime) | User $(whoami) ran $(basename "$0") with option $1" >> "$logfilelocation"
fi
