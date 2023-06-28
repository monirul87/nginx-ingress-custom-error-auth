#!/usr/bin/env bash

set -euo pipefail

cd "$(dirname "${0}")/.."

source scripts/commons.sh

install_helm

green "Setting up ingress-nginx Helm Repositories"
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update


green "Setting up ingress-nginx"
CHART_VERSION="4.7.0"
helm upgrade \
    --install \
    --wait \
    nginx-ingress ingress-nginx/ingress-nginx \
    --namespace nginx-ingress \
    --create-namespace \
    --version "${CHART_VERSION}" \
    -f nginx-ingress/nginx-ingress-values.yaml \
    --debug
