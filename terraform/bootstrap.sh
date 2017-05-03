#!/bin/bash
# Create an environment variable for the correct distribution
export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)"

# Add the Cloud SDK distribution URI as a package source
echo "deb https://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

# Import the Google Cloud Platform public key
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -

# Update the package list and install the Cloud SDK
apt-get update && sudo apt-get install -y google-cloud-sdk kubectl nano unzip git
wget -O /usr/bin/kops https://github.com/kubernetes/kops/releases/download/1.5.3/kops-linux-amd64
chmod +x /usr/bin/kops
gcloud config set compute/zone europe-west1-b
gcloud container clusters create training-cluster-$1


