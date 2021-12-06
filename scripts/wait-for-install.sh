#!/bin/sh
echo "Waiting for install to complete"
./bin/openshift-install --dir=./okd-ignition wait-for install-complete --log-level=debug