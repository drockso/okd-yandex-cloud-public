#!/bin/sh
FILE=./images/fcos34-gcp.qcow2
if [ -f "$FILE" ]; then
    echo "$FILE exists."
else 
    echo "Downloading FCOS 34 image. Must be for GCP (for yandex cloud to use *.ign files) and v34 (not 35) for OKD4.9"
    wget https://builds.coreos.fedoraproject.org/prod/streams/stable/builds/34.20211016.3.0/x86_64/fedora-coreos-34.20211016.3.0-gcp.x86_64.tar.gz -P ./temp

    echo "Extracting image..."
    tar xzf ./temp/fedora-coreos-34.20211016.3.0-gcp.x86_64.tar.gz --directory ./temp
    rm ./temp/fedora-coreos-34.20211016.3.0-gcp.x86_64.tar.gz

    echo "Converting to qcow2..."
    qemu-img convert -O qcow2 ./temp/disk.raw ./images/fcos34-gcp.qcow2
    rm ./temp/disk.raw
fi

FILE=./images/fedora-cloud-35-gcp.qcow2
if [ -f "$FILE" ]; then
    echo "$FILE exists."
else 
    echo "Downloading Fedora cloud 35 GCP image for bastion..."
    wget https://download.fedoraproject.org/pub/fedora/linux/releases/35/Cloud/x86_64/images/Fedora-Cloud-Base-GCP-35-1.2.x86_64.tar.gz -P ./temp

    echo "Extracting image..."
    tar xzf ./temp/Fedora-Cloud-Base-GCP-35-1.2.x86_64.tar.gz --directory ./temp
    rm ./temp/Fedora-Cloud-Base-GCP-35-1.2.x86_64.tar.gz

    echo "Converting to qcow2..."
    qemu-img convert -O qcow2 ./temp/disk.raw ./images/fedora-cloud-35-gcp.qcow2
    rm ./temp/disk.raw
fi