#!/bin/bash

kubectl create namespace monitoring --dry-run=client -o yaml | kubectl apply -f -

helm repo add prometheus-community https://prometheus-community.github.io/helm-charts

helm repo update

helm upgrade --install prometheus prometheus-community/prometheus \
  -n monitoring \
  -f values.yaml