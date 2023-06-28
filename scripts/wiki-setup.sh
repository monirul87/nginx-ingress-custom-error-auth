#!/usr/bin/env bash

set -euo pipefail

cd "$(dirname "${0}")/.."

source scripts/commons.sh

install_helm

green "Setting up wikijs Helm Repositories"
helm repo add requarks https://charts.js.wiki
helm repo update

green "Setting up wikijs"
CHART_VERSION="2.2.20"
helm upgrade \
    --install \
    --wait \
    arya-wiki requarks/wiki \
    --namespace wiki \
    --create-namespace \
    --version "${CHART_VERSION}" \
    -f wiki/db-secrets.yaml \
    -f wiki/wiki-values.yaml \
    --debug
