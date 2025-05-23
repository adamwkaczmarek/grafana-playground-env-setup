#!/bin/bash

terraform -chdir=./terraform init
terraform -chdir=./terraform plan
terraform -chdir=./terraform apply
kubectl expose service gls-grafana --type=NodePort --target-port=3000 --name=grafana-ext -n monitoring
minikube service grafana-ext -n monitoring