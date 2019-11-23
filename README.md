# random-admin

A chaotic assortment of random admin scripts in all sorts of flavors...

## get-kubectlclient.sh

Builds an installed set of kubectl client version in /usr/local/kubectl/{version} and will download and symlink to the version that matches the K8s cluster that you are currently connected to.

## get-kubectlversion.sh

Downloads a specific version of kubectl client into /usr/local/kubectl/{version} and symlinks kubectl into /usr/local/bin/kubectl

## get-helmclient.sh

Builds an install set of helm/tiller clients in /usr/local/helm/{version} and will download and symlink to the version that matches the version of Helm that is installed in your K8s cluster.

