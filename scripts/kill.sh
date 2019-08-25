#!/bin/bash

docker rm -v $(docker stop portainer)
docker volume rm portainer_data
