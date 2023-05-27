#!/bin/bash

# Shows a date that were while opening a script
# and a full directory of a script
date
echo "Location of a script - $PWD"

# Declared variables
# isPowOff1m - isPowerOff1minute
options=("Power Off - Shuts down the device immediately" 
"Power Off in 1 minute - Shuts down the device in 1 minute" 
"Reboot - Reboot the device" 
"Log Off - logs of from the root"
"Exit from Script")
quitOptions=("Yes" "No")
isPowOff1m=false

# Opening title and "choose an option" text
echo " _____   _   _   _____   _____   _          __  __   _  
/  ___/ | | | | |_   _| |  _  \ | |        / / |  \ | | 
| |___  | |_| |   | |   | | | | | |  __   / /  |   \| | 
\___  \ |  _  |   | |   | | | | | | /  | / /   | |\   | 
 ___| | | | | |   | |   | |_| | | |/   |/ /    | | \  | 
/_____/ |_| |_|   |_|   |_____/ |___/|___/     |_|  \_| "
echo "Choose an option of exiting a device"

# Choosing options of the next procedure of a script
# Lists out options of rebutting or exitting a device in Linux
select opt in "${options[@]}"
do
case $opt in
"Power Off - Shuts down the device immediately")
    echo "Shutting down a device..."
    shutdown now
    ;;
"Power Off in 1 minute - Shuts down the device in 1 minute")
    echo "Shutting down a device in 10 second..."
    shutdown -t 1
    isPowOff1m=true
    break
    ;;
"Reboot - Reboot the device")
    echo "Rebooting the device..."
    reboot
    ;;
"Log Off - logs of from the root")
    echo "Logging off the root..."
    exit
    ;;
"Exit from Script")
    echo "Exitting from the script..."
    exit
    ;;
*)
    echo "Invalid option '$REPLY'";;
    esac
done

# If an options Power off in 1 minute was pressed then
# this will activate
# Gives a one last sign to cancel a shutdown or no
if [ $isPowOff1m = true ]
then
    echo "Do you want to cancel the shutdown?"
    select quit in "${quitOptions[@]}"
    do
    case $quit in
    "Yes")
        echo "Cancelling..."
        shutdown -c
        exit
        ;;
    "No")
        echo "See you on the other side :)"
        exit
        ;;
    *)
        echo "Invalid option '$REPLY'";;
        esac
    done
else
    exit
fi