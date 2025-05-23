# 📊 Grafana Playground Env Setup
This project provides a lightweight and reproducible Grafana monitoring environment using Terraform and Minikube. It’s ideal for local experimentation, dashboard prototyping, or learning observability tools without needing a cloud setup.

## 🔧 What's Included
Terraform configuration to deploy:

 - Grafana
 - Prometheus
 - Loki + Promtail (for logs)
 - Preconfigured data sources in Grafana (Prometheus & Loki)
 - Example spring-boot app

Comment:  To simplify deployment [Loki Stack Helm Chart](https://github.com/grafana/helm-charts/blob/main/charts/loki-stack/README.md) has been used 

Automation scripts to:
 - Check and start Minikube if it's not running
 - Deploy the full monitoring stack locally
 - Simplify environment teardown and rebuilds

## 🚀 Quick Start
### Preconditions
Install before you start :
- [minikube](https://minikube.sigs.k8s.io/docs/start/?arch=%2Flinux%2Fx86-64%2Fstable%2Fbinary+download)
- [kubectl](https://kubernetes.io/docs/tasks/tools/)
- [helm](https://helm.sh/docs/intro/install/)
- [terafrom](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

### Steps
1. Clone this repo
2. Run the `run-local.sh`.
3. Run the `stop-local.sh` when you are done.

## 🧩 Features
- Ready-to-use data sources (Prometheus & Loki)
- Modular and clean Terraform layout
- Minimal dependencies: just Terraform, Minikube, and Helm

## 🔗Helper links





