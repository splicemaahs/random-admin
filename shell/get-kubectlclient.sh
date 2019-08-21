#!/bin/bash
# lrwxr-xr-x  1 cmaahs  staff    55B Apr 13 06:43 /usr/local/bin/kubectl -> /Applications/Docker.app/Contents/Resources/bin/kubectl
if [ ! -d "/usr/local/kubectl" ]; then
  MY_LOGON=$(whoami)
  sudo mkdir -p /usr/local/kubectl
  sudo chown ${MY_LOGON}:admin /usr/local/kubectl
fi;
KUBECTL_SERVER=$(kubectl version --output=json | jq -r .serverVersion.gitVersion)
echo ${KUBECTL_SERVER}
if [[ ! -z "${KUBECTL_SERVER}" ]]; then
  if [ ! -d "/usr/local/kubectl/${KUBECTL_SERVER}" ]; then
    mkdir -p "/usr/local/kubectl/${KUBECTL_SERVER}"
    wget --quiet -O "/usr/local/kubectl/${KUBECTL_SERVER}/kubectl" "https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_SERVER}/bin/darwin/amd64/kubectl"
    if [ -f "/usr/local/kubectl/${KUBECTL_SERVER}/kubectl" ]; then
      chmod 775 "/usr/local/kubectl/${KUBECTL_SERVER}/kubectl"
      if [ -f "/usr/local/bin/kubectl" ]; then
        rm "/usr/local/bin/kubectl"
        ln -s "/usr/local/kubectl/${KUBECTL_SERVER}/kubectl" "/usr/local/bin/kubectl"
      fi
    fi
  fi
fi

