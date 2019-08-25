#!/bin/bash

if [ ! -f .env ]; then
  echo "Copy .sample.env to .env and modify it to suit your setup"
  exit 1
fi

if [ $(cat password) = "changeMe" ]; then
  echo "Modify the password file"
  exit 1
fi

docker run -d \
--name=portainer \
--restart=always \
--network=webproxy \
--env-file .env \
-v $(pwd)/password:/tmp/passwd \
-v portainer_data:/data \
portainer/portainer \
--admin-password-file /tmp/passwd
