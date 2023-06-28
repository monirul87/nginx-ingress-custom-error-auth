#!/usr/bin/env bash

set -euo pipefail

RED_COLOR="\033[1;31m"
GREEN_COLOR="\033[1;32m"
YELLOW_COLOR="\033[1;33m"
NO_COLOR="\033[0m"

function print_out() {
  local text="${1}"
  echo -e "\n${text}"
}

function red() {
  local text="${1}"
  print_out "${RED_COLOR}${text}${NO_COLOR}"
}

function green() {
  local text="${1}"
  print_out "${GREEN_COLOR}${text}${NO_COLOR}"
}

function yellow() {
  local text="${1}"
  print_out "${YELLOW_COLOR}${text}${NO_COLOR}"
}

function error_exit() {
  local text="${1}"
  red "ERROR: ${text}\n"
  exit 1
}

function command_exists() {
  command -v "${1}" >/dev/null 2>&1
}

function install_helm() {
    if command_exists /usr/local/bin/helm; then
        echo "Helm is installed already"
    else
        local HELM_VERSION="v3.7.2"
        curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash -s -- --version "${HELM_VERSION}"
    fi
}


