#!/bin/bash

set -o nounset
set -o pipefail
set -o errexit
set -o xtrace

# Install prerequisites
apt-get update
apt-get install -y wget gnupg lsb-release


# Install script
apt-get install -y apt-transport-https
wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | apt-key add -
echo deb https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main | tee -a /etc/apt/sources.list
apt-get update
apt-get install -y trivy

