#!/bin/bash
TAG=$1
echo "start tiller"
export KUBECONFIG=$HOME/.kube/kubeconfig
helm tiller start-ci
export HELM_HOST=127.0.0.1:44134
result=$(eval helm ls | grep appman-demo)
if [ $? -ne "0" ]; then
   helm install --timeout 180s --name appman-demo --set image.tag=$TAG charts/appman-demo
else
   helm upgrade --timeout 180s appman-demo --set image.tag=$TAG charts/appman-demo
fi
echo "stop tiller"
helm tiller stop