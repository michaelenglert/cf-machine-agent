#!/bin/bash

if [ $# -lt 2 ]; then
    echo "Usage: $0 <username> <version>"
    exit 1
fi

version="$2"
baseurl='https://aperture.appdynamics.com/download/prox/download-file'
loginurl='https://login.appdynamics.com/sso/login/'

read -p "Password: " -s password

curl --referer http://www.appdynamics.com -c ./cookies.txt -d "username=$1&password=$password" $loginurl

curl -L -o machineagent.zip -b ./cookies.txt $baseurl/machine/$version/MachineAgent-$version.zip

unzip machineagent.zip

rm -rf ./cookies.txt machineagent.zip bin/machine-agent* bin/agent-failure-action.cmd

#Disable the Standard Montors
sed -i -e "s/<enabled>true<\/enabled>/<enabled>false<\/enabled>/g" $(find . -name "monitor.xml")
#Direct Log Output to Stdout
sed -i -e "s/ref=\"FileAppender\"/ref=\"ConsoleAppender\"/g" $(find . -name "log4j.xml")


exit 0
