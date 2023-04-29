#!/bin/bash

date
chmod 755 poweroff.sh
echo "Location of a script - $PWD"
options=("Power Off - Shuts down the device immediately" 
"Power Off in 10 seconds - Shuts down the device in 10 seconds" 
"Reboot - Reboot the device" 
"Log Off - logs of from the root" 
"Quit")

echo "Choose an option of exiting a device"
select opt in "${options[@]}"
do
case $opt in
"Power Off - Shuts down the device immediately")
    echo "Shutting down a device"
    systemctl poweroff
    ;;
"Power Off in 10 seconds - Shuts down the device in 10 seconds")
    echo "Shutting down a device in 10 second"
    systemctl poweroff
    ;;
"Reboot - Reboot the device")
    echo "Rebooting the device..."
    reboot
    ;;
"Log Off - logs of from the root")
    echo "Logginf off the root..."
    logout
    ;;
"Quit")
    break;
    ;;
*)
    echo "invalid option $REPLY";;
    esac
done
