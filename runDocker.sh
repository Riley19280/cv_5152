#!/bin/bash

echo "start in docker"

docker kill cv_5152

docker build --rm -t local/cv_5152 -t 025221494343.dkr.ecr.us-east-1.amazonaws.com/rileystech:cv_5152 .


if [ "$1" = "run" ]; then
  docker run -d --rm --privileged -p 80:80 -p 9000 --network proxynet --ip 172.30.0.23 --name cv_5152 local/cv_5152
fi



if [ "$1" = "push" ]; then
#  if grep -q '?'  ../config.json; then
#    echo -e "\033[0;31mERROR: Config file does not contain correct prefix \033[0m";
#    exit
#  fi

  $(aws ecr get-login --no-include-email)
  docker push 025221494343.dkr.ecr.us-east-1.amazonaws.com/rileystech:cv_5152
fi
