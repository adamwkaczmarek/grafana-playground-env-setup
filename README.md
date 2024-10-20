# Playground env setup
Setup for playground env
## Preconditions 
Install before you start : 
- [minikube](https://minikube.sigs.k8s.io/docs/start/?arch=%2Flinux%2Fx86-64%2Fstable%2Fbinary+download)
- [kubectl](https://kubernetes.io/docs/tasks/tools/)
- [helm](https://helm.sh/docs/intro/install/)
- [terafrom](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

## Env setup
Go to `./terraform` directory and run following commands :

`terraform init`

`terraform apply`

## Expose Grafa UI

`kubectl expose service grafana --type=NodePort --target-port=3000 --name=grafana-ext -n monitoring`

`minikube service grafana-ext -n monitoring`


## Helper links
- https://vaibhavji.medium.com/deploying-prometheus-and-grafana-for-observability-on-a-minikube-cluster-using-daemonset-266e2df7e454
- https://github.com/sl1pm4t/k2tf?tab=readme-ov-file
- https://github.com/adecchi/terraform-minikube
- https://vaibhavji.medium.com/deploy-kubernetes-resources-in-minikube-cluster-using-terraform-8dde6dd72bc4






