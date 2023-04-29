#!/bin/bash

chmod 755 poweroff.sh
echo "You're located in : $PWD"

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    echo "it's linux"
    systemctl poweroff
elif [[ "$OSTYPE" == "msys"* ]]; then
    echo "it's windows"
    shutdown -s
elif [[ "$OSTYPE" == "cygwin"* ]]; then
    echo "it's windows"
    shutdown -s
fi