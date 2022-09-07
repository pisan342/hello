#!/bin/bash
##################################################
# Script to start CSS container and connect to it
##################################################

# CHANGE THE BELOW VARIABLES
netid="CHANGEME"
localdir="${HOME}"

##################################################
# Do not edit below this line
##################################################


if [ -z "`docker ps -a | grep ${netid}LinuxMachine`" ]
then
    echo "# Starting ${netid}LinuxMachine"
    docker run -ti --name="${netid}LinuxMachine" -h LinuxMachine -w /home/cssuwbstudent/${netid} -v ${localdir}:/home/cssuwbstudent/${netid} -d cssimages/csslab:latest 
else
    echo "# ${netid}LinuxMachine container is already running"
fi

echo "# Connecting to ${netid}LinuxMachine"
docker exec -it ${netid}LinuxMachine /bin/bash

# to stop/remove container use
echo "# If you will no longer use this container, stop and remove ${netid}LinuxMachine using:"
echo "docker stop ${netid}LinuxMachine ; docker rm ${netid}LinuxMachine"

