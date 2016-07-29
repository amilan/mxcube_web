=======================
MXCuBE Docker container
=======================

Introduction
------------
This is a first implementation of a docker container which is able to run 
the MXCuBE web application.

It's based on a centOS 7 image and has been built following the procedure
listed in MXCuBE web's wiki: 
.. _MXCuBE Installation tutorial: https://github.com/mxcube/mxcube3/wiki/How-to:-Installation

Installing Docker
-----------------
You can find more information about Docker installation here:
.. _Docker documentation: https://docs.docker.com/

Building the image
------------------
To build the image you can clone this repository and run:
    docker build -t mxcube_web .

Running MXCuBE
--------------
In order to run the container you can use one of the following options:
    docker run -i -t mxcube_web /bin/bash

Useful commands
---------------
Run your container with map forwarding
    docker run -d --name mxcube -p 8090:8090

List all the containers and remove the selected one
    docker ps -a
    docker rm <container_name>

    docker run -i -p 8090:8090 -t mxcube_web python mxcube3-server -r test/HardwareObjectsMockup.xml --log-file mxcube.log

TODO's
------
[] Entrypoint it's not working
[] Volume mapping for data??


