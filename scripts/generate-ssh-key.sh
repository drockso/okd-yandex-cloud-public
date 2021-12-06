#!/bin/sh
FILE=./secrets/id_rsa
if [ -f "$FILE" ]; then
    echo "$FILE exists."
else 
    echo "Generating new SSH keypair for FCOS nodes..."
    ssh-keygen -t rsa -f ./secrets/id_rsa -q -N ""
fi
