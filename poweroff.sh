#!/bin/bash

chmod u+x poweroff.sh

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    systemctl poweroff
    echo "it's linux"
elif [[ "$OSTYPE" == "msys"* ]]; then
    shutdown -s
    echo "it's windows"
elif [[ "$OSTYPE" == "cygwin"* ]]; then
    echo "it's windows"
    shutdown -s
    
fi