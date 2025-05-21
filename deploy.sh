terraform -chdir=./terraform init
terraform -chdir=./terraform plan
terraform -chdir=./terraform apply
kubectl expose service grafana --type=NodePort --target-port=3000 --name=grafana-ext -n playground
minikube service grafana-ext -n playground