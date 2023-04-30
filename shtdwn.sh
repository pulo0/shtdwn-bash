#!/bin/bash

date
echo "Location of a script - $PWD"

options=("Power Off - Shuts down the device immediately" 
"Power Off in 1 minute - Shuts down the device in 1 minute" 
"Reboot - Reboot the device" 
"Log Off - logs of from the root")
quitOptions=("Yes" "No")
isPowOff1m=false

echo "Choose an option of exiting a device"
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
*)
    echo "Invalid option '$REPLY'";;
    esac
done

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