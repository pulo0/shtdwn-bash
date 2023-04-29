#!/bin/bash

date
chmod 755 poweroff.sh
echo "Location of a script - $PWD"

options=("Power Off - Shuts down the device immediately" 
"Power Off in 1 minute - Shuts down the device in 1 minute" 
"Reboot - Reboot the device" 
"Log Off - logs of from the root" 
"Quit")

quitOptions=("Yes" "No")

echo "Choose an option of exiting a device"
select opt in "${options[@]}"
do
case $opt in
"Power Off - Shuts down the device immediately")
    echo "Shutting down a device..."
    systemctl shutdown now
    ;;
"Power Off in 1 minute - Shuts down the device in 1 minute")
    echo "Shutting down a device in 10 second..."
    systemctl shutdown -t 1
    ;;
"Reboot - Reboot the device")
    echo "Rebooting the device..."
    reboot
    ;;
"Log Off - logs of from the root")
    echo "Logging off the root..."
    exit
    ;;
"Quit")
    break
    ;;
*)
    echo "Invalid option '$REPLY'";;
    esac
done

if [[$opt == "Power Off in 10 seconds - Shuts down the device in 10 seconds"]]
then
    echo "Do you want to cancel the shutdown?"
    select quit in "${quitOptions[@]}"
    do
    case $quit in
    "Yes")
        echo "Cancelling..."
        systemctl shutdown -c
        ;;
    "No")
        echo "See you on the other side :)"
        break
        ;;
    *)
        echo "Invalid option '$REPLY'";;
        esac
    done
else
    break