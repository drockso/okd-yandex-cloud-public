#!/bin/sh

FILE=./bin/openshift-install
if [ -f "$FILE" ]; then
    echo "$FILE exists."
else 
    echo "Downloading OKD openshift-install..."
    wget "https://github.com/openshift/okd/releases/download/4.9.0-0.okd-2021-11-28-035710/openshift-install-linux-4.9.0-0.okd-2021-11-28-035710.tar.gz" -P ./temp
    echo "Extracting openshift-install..."
    tar xzf ./temp/openshift-install-linux-4.9.0-0.okd-2021-11-28-035710.tar.gz --directory ./bin
    echo "Removing tar..."
    rm ./temp/openshift-install-linux-4.9.0-0.okd-2021-11-28-035710.tar.gz
    echo "Giving +x"
    chmod +x ./bin/openshift-install
fi

FILE=./bin/oc
if [ -f "$FILE" ]; then
    echo "$FILE exists."
else 
    echo "Downloading OKD OC..."
    wget "https://github.com/openshift/okd/releases/download/4.9.0-0.okd-2021-11-28-035710/openshift-client-linux-4.9.0-0.okd-2021-11-28-035710.tar.gz" -P ./temp
    echo "Extracting openshift-install..."
    tar xzf ./temp/openshift-client-linux-4.9.0-0.okd-2021-11-28-035710.tar.gz --directory ./bin
    echo "Removing tar..."
    rm ./temp/openshift-client-linux-4.9.0-0.okd-2021-11-28-035710.tar.gz
    echo "Giving +x"
    chmod +x ./bin/oc
fi