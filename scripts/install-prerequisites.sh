#!/bin/sh
OS=$(awk '/DISTRIB_ID=/' /etc/*-release | sed 's/DISTRIB_ID=//' | tr '[:upper:]' '[:lower:]');
ARCH=$(uname -m | sed 's/x86_//;s/i[3-6]86/32/');
VERSION=$(awk '/DISTRIB_RELEASE=/' /etc/*-release | sed 's/DISTRIB_RELEASE=//' | sed 's/[.]0/./');

if [ "$OS" = "ubuntu" ] || [ "$OS" = "debian" ]; then
    echo "Installing required prerequisites for Ubuntu/Debian..."
    sudo apt update
    sudo apt install -y wget tar qemu-utils gnupg software-properties-common curl gnupg1 gnupg2 libvirt0
    curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
    sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
    sudo apt update && sudo apt install -y terraform
fi