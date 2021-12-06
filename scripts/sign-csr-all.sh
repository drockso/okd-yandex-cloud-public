#!/bin/sh
echo "Setting config for OC..."
export KUBECONFIG=./okd-ignition/auth/kubeconfig
echo "Signing all pending certificates..."
./bin/oc get csr -o go-template='{{range .items}}{{if not .status}}{{.metadata.name}}{{"\n"}}{{end}}{{end}}' | xargs ./bin/oc adm certificate approve
echo "Showing certs..."
./bin/oc get csr