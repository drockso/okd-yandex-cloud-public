#!/bin/sh
FILE=./okd-ignition/bootstrap.ign
if [ -f "$FILE" ]; then
    echo "$FILE exists."
else
    echo "Generating ignitions..."
    cp ./okd-config/install-config.yaml ./okd-ignition/install-config.yaml
    ./bin/openshift-install create manifests --dir="./okd-ignition"
    ./bin/openshift-install create ignition-configs --dir="./okd-ignition"
fi