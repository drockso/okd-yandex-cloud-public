#!/bin/sh
export KUBECONFIG=./okd-ignition/auth/kubeconfig
./bin/oc get nodes