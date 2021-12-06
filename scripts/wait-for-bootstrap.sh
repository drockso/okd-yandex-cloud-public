#!/bin/sh
echo "Waiting for bootstrap to complete"
./bin/openshift-install --dir=./okd-ignition wait-for bootstrap-complete --log-level=debug