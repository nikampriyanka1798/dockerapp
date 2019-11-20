#!/bin/bash

# install the anuglar dependency
# npm install

# build the application


# ng build --prod

# remove the container if exists or running
if [ $(sudo docker container ls -q --filter name=db_container) != '' ]; then
    sudo docker container stop db_container
    sudo docker container rm db_container
fi

# remove the image if exists
if [ $(sudo docker image ls -q --filter reference=db_image) != '' ]; then
    sudo docker image rm db_image
fi

# build the image
sudo docker build -t db_image .

# start the container
sudo docker run -itd -p 3308:3306 --name db_container db_image
